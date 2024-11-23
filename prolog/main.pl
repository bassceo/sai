% факты с одним аргументом:

% персонажи в mafia 1
character(tommy).
character(paulie).
character(sam).
character(don_salieri).
character(don_morello).
character(frank).
character(ralph).
character(luigi).
character(sarah).
character(vincenzo).
character(lucas_bertone).
character(bill).
character(morello_guard).
character(norman).
character(carlo).
character(sergio).
character(michelle).
character(ennio_salieri).
character(pepe).
character(giorgio).

% оружие в игре
weapon(revolver).
weapon(shotgun).
weapon(thompson).
weapon(baseball_bat).
weapon(sniper_rifle).

% транспорт в игре
vehicle(taxi).
vehicle(ford_v8).
vehicle(black_car).
vehicle(truck).
vehicle(bicycle).

% миссии в игре
mission(fairplay).
mission(bastards_luck).
mission(happy_birthday).
mission(omerta).
mission(better_get_used_to_it).

% факты с двумя аргументами:

% отношения и свойства между персонажами

% ��ерсонажи, работающие на дона сальери
works_for(tommy, don_salieri). 
works_for(paulie, don_salieri).
works_for(sam, don_salieri).   
works_for(frank, don_salieri). 
works_for(ralph, don_salieri). 
works_for(luigi, don_salieri). 
works_for(vincenzo, don_salieri).

% персонажи, предавшие персонажа
betrayed(frank, don_salieri). 
betrayed(carlo, don_salieri). 

% враждебные отношения между донами
enemy(don_salieri, don_morello).  
enemy(don_morello, don_salieri). 

% оружие, используемое персонажами
uses_weapon(tommy, thompson).    
uses_weapon(tommy, baseball_bat). 
uses_weapon(paulie, shotgun).    
uses_weapon(sam, revolver).      
uses_weapon(vincenzo, revolver). 

% автомобили, которыми управляют персонажи
drives(tommy, taxi).      
drives(ralph, ford_v8).        
drives(lucas_bertone, black_car). 

% помощь персонажей друг другу
helps(tommy, sarah).            

% быстрые автомобили
fast_car(ford_v8).               
fast_car(black_car).     

% дружеские отношения между персонажами
friend(tommy, paulie).           
friend(tommy, sam). 
friend(paulie, sam).

% власть и подчинение
boss(don_salieri, tommy).
boss(don_salieri, paulie).
boss(don_salieri, sam).

% консильери дона сальери
consigliere(frank).

% правила:

% персонаж лоялен дону сальери, если он работает на него и не предавал его
loyal(X) :- works_for(X, don_salieri), \+ betrayed(X, don_salieri).

% два персонажа — союзники, если они работают на одного босса и это не один и тот же человек
ally(X, Y) :- works_for(X, boss), works_for(Y, boss), X \= Y.

% персонаж опасен, если он использует томпсон или дробовик
dangerous(X) :- uses_weapon(X, thompson).
dangerous(X) :- uses_weapon(X, shotgun).

% персонаж является врагом другого, если они враги
enemy_of(X, Y) :- enemy(X, Y).
enemy_of(X, Y) :- enemy(Y, X).

% персонаж водит быстрые машины, если он водит транспортное средство, которое является быстрой машиной
drives_fast_cars(X) :- 
    drives(X, Vehicle), 
    fast_car(Vehicle).

% персонаж является боссом другого, если тот работает на него
boss_of(X, Y) :- works_for(Y, X).

% дружба взаимна
friendship(X, Y) :- friend(X, Y).
friendship(X, Y) :- friend(Y, X).

% персонаж является соперником другого, если они враги и не работают на одного босса
rival(X, Y) :- enemy(X, Y), \+ (works_for(X, boss), works_for(Y, boss)).