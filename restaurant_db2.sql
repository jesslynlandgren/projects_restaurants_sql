CREATE TABLE restaurant (
  id int primary key,
  name varchar,
  address varchar,
  category varchar
);


CREATE TABLE reviewer (
  id int primary key,
  name varchar,
  email varchar,
  karma int check (karma >=0 and karma <= 7)
);

CREATE TABLE review (
  id serial primary key,
  reviewerID int references reviewer(id),
  restaurantID int references restaurant(id),
  stars int check (stars>=1 and stars <=5),
  title varchar,
  review text
);


insert into restaurant values (1, 'rusans', 'buckhead', 'asian');
insert into restaurant values (2, 'freshbowl', 'lawrenceville', 'asian');
insert into restaurant values (3, 'thaispice', 'iowacity', 'asian');
insert into restaurant values (4, 'formosa', 'iowacity', 'asian');
insert into restaurant values (5, 'i<3pho', 'coralville', 'asian');
insert into restaurant values (6, 'naanstop', 'buckhead', 'indian');
insert into restaurant values (7, 'indiacafe', 'iowacity', 'indian');
insert into restaurant values (8, 'masala', 'iowacity', 'indian');
insert into restaurant values (9, 'haveli', 'coralville', 'indian');
insert into restaurant values (10,'subway', 'buckhead', 'sandwich');
insert into restaurant values (11, 'nodo', 'iowacity', 'sandwich');
insert into restaurant values (12, 'bruggers', 'iowacity', 'sandwich');
insert into restaurant values (13, 'mamas', 'iowacity', 'sandwich');
insert into restaurant values (14, 'whichwich', 'coralville', 'sandwich');

insert into reviewer values (1, 'bob','bob@gmail.com',5);
insert into reviewer values (2, 'joe','joe@gmail.com',2);
insert into reviewer values (3, 'jane','jane@gmail.com',6);
insert into reviewer values (4, 'jim','jim@gmail.com',3);

insert into review values (default, 1, 1, 5, 'best', 'amazing');
insert into review values (default, 1, 2, 3, 'best', 'amazing');
insert into review values (default, 1, 3, 1, 'best', 'amazing');
insert into review values (default, 1, 4, 2, 'best', 'amazing');
insert into review values (default, 1, 5, 5, 'best', 'amazing');
insert into review values (default, 1, 6, 4, 'best', 'amazing');
insert into review values (default, 1, 7, 3, 'best', 'amazing');
insert into review values (default, 1, 8, 1, 'best', 'amazing');
insert into review values (default, 1, 9, 2, 'best', 'amazing');
insert into review values (default, 1, 10, 4, 'best', 'amazing');
insert into review values (default, 1, 11, 3, 'best', 'amazing');
insert into review values (default, 1, 12, 1, 'best', 'amazing');
insert into review values (default, 1, 13, 1, 'best', 'amazing');
insert into review values (default, 1, 14, 5, 'best', 'amazing');

insert into review values (default, 2, 1, 4, 'best', 'amazing');
insert into review values (default, 2, 2, 1, 'best', 'amazing');
insert into review values (default, 2, 3, 3, 'best', 'amazing');
insert into review values (default, 2, 4, 5, 'best', 'amazing');
insert into review values (default, 2, 5, 1, 'best', 'amazing');
insert into review values (default, 2, 6, 2, 'best', 'amazing');
insert into review values (default, 2, 7, 2, 'best', 'amazing');
insert into review values (default, 2, 8, 3, 'best', 'amazing');
insert into review values (default, 2, 9, 5, 'best', 'amazing');
insert into review values (default, 2, 10, 4, 'best', 'amazing');
insert into review values (default, 2, 11, 3, 'best', 'amazing');
insert into review values (default, 2, 12, 2, 'best', 'amazing');
insert into review values (default, 2, 13, 1, 'best', 'amazing');
insert into review values (default, 2, 14, 5, 'best', 'amazing');

insert into review values (default, 3, 1, 2, 'best', 'amazing');
insert into review values (default, 3, 2, 1, 'best', 'amazing');
insert into review values (default, 3, 3, 3, 'best', 'amazing');
insert into review values (default, 3, 4, 4, 'best', 'amazing');
insert into review values (default, 3, 5, 5, 'best', 'amazing');
insert into review values (default, 3, 6, 4, 'best', 'amazing');
insert into review values (default, 3, 7, 3, 'best', 'amazing');
insert into review values (default, 3, 8, 2, 'best', 'amazing');
insert into review values (default, 3, 9, 1, 'best', 'amazing');
insert into review values (default, 3, 10, 5, 'best', 'amazing');
insert into review values (default, 3, 11, 4, 'best', 'amazing');
insert into review values (default, 3, 12, 3, 'best', 'amazing');
insert into review values (default, 3, 13, 1, 'best', 'amazing');
insert into review values (default, 3, 14, 5, 'best', 'amazing');

insert into review values (default, 4, 1, 1, 'best', 'amazing');
insert into review values (default, 4, 2, 2, 'best', 'amazing');
insert into review values (default, 4, 3, 3, 'best', 'amazing');
insert into review values (default, 4, 4, 4, 'best', 'amazing');
insert into review values (default, 4, 5, 5, 'best', 'amazing');
insert into review values (default, 4, 6, 4, 'best', 'amazing');
insert into review values (default, 4, 7, 3, 'best', 'amazing');
insert into review values (default, 4, 8, 3, 'best', 'amazing');
insert into review values (default, 4, 9, 5, 'best', 'amazing');
insert into review values (default, 4, 10, 1, 'best', 'amazing');
insert into review values (default, 4, 11, 2, 'best', 'amazing');
insert into review values (default, 4, 12, 3, 'best', 'amazing');
insert into review values (default, 4, 13, 5, 'best', 'amazing');
insert into review values (default, 4, 14, 4, 'best', 'amazing');

--1
select * from review where restaurantID = 4;

--2
select * from review where reviewerID = 2;

--3
select restaurant.name, review.review from restaurant,review where restaurant.id = review.restaurantID;

--4
select restaurant.name, avg(review.stars) from restaurant,review where restaurant.id = review.restaurantID group by restaurant.name;

--5
select restaurant.name, count(review.*) from restaurant,review where restaurant.id = review.restaurantID group by restaurant.name;

--6
select restaurant.name, review.review, reviewer.name from restaurant, review, reviewer where restaurant.id = review.restaurantID and reviewer.id = review.reviewerID;

--7
select reviewer.name, avg(review.stars) from reviewer,review where reviewer.id = review.reviewerID group by reviewer.name;

--8
select reviewer.name, min(review.stars) from reviewer,review where reviewer.id = review.reviewerID group by reviewer.name;

--9
select category, count(*) from restaurant group by category;

--10
select restaurant.name, count(review.*) from restaurant, review where restaurant.id = review.restaurantID and review.stars = 5 group by restaurant.name;

--11
select restaurant.category, avg(review.stars) from restaurant,review where restaurant.id = review.restaurantID group by restaurant.category;
