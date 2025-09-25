Create Database ZooDB

create table AnimalType (animal_type_id int primary key not null,
						 type_name nvarchar(100) not null,
						 [description] nvarchar(max) null)

create table SpeciesInfo (species_info_id int primary key not null,
						  common_name NVARCHAR(100) not null,
						  scientific_name NVARCHAR(100) null,
						  habitat NVARCHAR(MAX) null,
						  diet NVARCHAR(MAX) null,
						  conservation_status NVARCHAR(100) null,
						  [description] NVARCHAR(MAX) null)

create table Enclosure (enclosure_id int primary key not null,
						name NVARCHAR(100) not null,
						location NVARCHAR(200) null)

create table Keeper (keeper_id int primary key not null,
					 name NVARCHAR(100) not null,
					 phone NVARCHAR(50) null,
					 email NVARCHAR(100) null)

create table EnclosureKeeper (enclosure_id int not null,
							  keeper_id int not null,
							  primary key(enclosure_id, keeper_id),
							  FOREIGN KEY(enclosure_id) references Enclosure(enclosure_id),
							  FOREIGN KEY(keeper_id) references Keeper(keeper_id));

create table Food (food_id int primary key not null,
				   name NVARCHAR(100) not null,
				   type NVARCHAR(100) null,
				   unit NVARCHAR(50) null)

create table Animal (animal_id int primary key not null,
					 name NVARCHAR(100) not null,
					 gender NVARCHAR(10) null,
					 birth_date DATE null,
					 enclosure_id int not null,
					 animal_type_id int not null,
					 species_info_id int not null,
					 FOREIGN KEY(enclosure_id) references Enclosure(enclosure_id),
					 FOREIGN KEY(animal_type_id) references AnimalType(animal_type_id),
					 FOREIGN KEY(species_info_id) references SpeciesInfo(species_info_id));

create table FeedingSchedule (feeding_id int primary key not null,
							  animal_id int not null,
							  food_id int not null,
							  amount DECIMAL(10,2) null,
							  feeding_date DATE null,
							  feeding_time TIME null,
							  keeper_id int not null,
							  foreign key(animal_id) references Animal(animal_id),
							  foreign key(food_id) references Food(food_id),
							  foreign key(keeper_id) references Keeper(keeper_id));


select * from Animal
