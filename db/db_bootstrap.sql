CREATE DATABASE final_project_db;
CREATE USER 'webapp'@'%' IDENTIFIED BY 'zabaransu';
GRANT ALL PRIVILEGES ON final_project_db.* TO 'webapp'@'%';
FLUSH PRIVILEGES ;

USE final_project_db;


-- Creating tables
create table Company_Addresses (
	CompanyAddressID INT PRIMARY KEY,
	Street VARCHAR(50),
	City VARCHAR(50),
	State VARCHAR(50)
);

create table Company (
	CompanyID INT PRIMARY KEY ,
	Name VARCHAR(50),
	Size INT,
	Industry VARCHAR(50),
	Country VARCHAR(50),
	CompanyAddressID INT,
	FOREIGN KEY (CompanyAddressID) REFERENCES Company_Addresses(CompanyAddressID)
);

create table Revenue (
	CompanyID INT PRIMARY KEY,
	`2017` VARCHAR(50),
	`2018` VARCHAR(50),
	`2019` VARCHAR(50),
	`2020` VARCHAR(50),
	`2021` VARCHAR(50),
	FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);

create table Market_Share (
	CompanyID INT,
	`2017` DECIMAL(4,2),
	`2018` DECIMAL(4,2),
	`2019` DECIMAL(4,2),
	`2020` DECIMAL(4,2),
	`2021` DECIMAL(4,2),
	FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);

create table Profit (
	CompanyID INT,
	`2017` VARCHAR(50),
	`2018` VARCHAR(50),
	`2019` VARCHAR(50),
	`2020` VARCHAR(50),
	`2021` VARCHAR(50),
	FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);

create table Stock (
	StockID INT PRIMARY KEY ,
	Name VARCHAR(50) NOT NULL ,
	QuantityAvailable INT,
	PurchaseLimit INT,
	QuantitySold INT,
	PriceMin VARCHAR(50),
	PriceMax VARCHAR(50),
	CurrPrice VARCHAR(50),
	DateListed DATE
);

create table Admin_Addresses (
	AdminAddressID INT PRIMARY KEY ,
	Street VARCHAR(50),
	City VARCHAR(50),
	State VARCHAR(50)
);

create table Admin (
	EmployeeID INT PRIMARY KEY ,
	First_Name VARCHAR(50),
	Last_Name VARCHAR(50),
	Email VARCHAR(50),
	Phone VARCHAR(50),
	Title VARCHAR(50),
	BirthDate DATE,
	AdminAddressID INT,
	FOREIGN KEY (AdminAddressID) REFERENCES Admin_Addresses(AdminAddressID)
);

create table Customer (
	CustID INT PRIMARY KEY ,
	First_Name VARCHAR(50),
	Last_Name VARCHAR(50),
	Email VARCHAR(50),
	DOB DATE,
	Region VARCHAR(50),
	Phone VARCHAR(50),
	SSN VARCHAR(50),
	Credit_Card VARCHAR(50)
);


create table Authentication (
	CustID INT PRIMARY KEY ,
	Type VARCHAR(50) ,
	AuthNum VARCHAR(50) ,
	FOREIGN KEY (CustID) REFERENCES Customer(CustID)
);

create table Customer_Finance_Details (
	CustID INT PRIMARY KEY ,
	CreditScore INT,
	Income VARCHAR(50),
	AmountTraded VARCHAR(50),
	FOREIGN KEY (CustID) REFERENCES Customer(CustID)
);

create table Company_Invoice (
	CompInvoiceID INT PRIMARY KEY ,
	AdminID INT,
	StockID INT,
	CompanyID INT,
	Commission DECIMAL(3,2),
	Quantity INT,
	Date DATE,
	Time VARCHAR(50),
	FOREIGN KEY (AdminID) REFERENCES Admin(EmployeeID),
	FOREIGN KEY (StockID) REFERENCES Stock(StockID),
	FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);

create table Customer_Transactions (
	TransactionID INT PRIMARY KEY ,
	SupportRepID INT,
	CustomerID INT,
	StockID INT,
	Type VARCHAR(50),
	Date DATE,
	Time VARCHAR(50),
	Stock_Quantity INT,
	Price_Traded_At INT,
	TotalPrice INT,
	FOREIGN KEY (SupportRepID) REFERENCES Admin(EmployeeID),
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustID),
	FOREIGN KEY (StockID) REFERENCES Stock(StockID)
);
-- Entering the data

-- Company Address
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (1, '8359 Shopko Pass', 'Waterloo', 'IA');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (2, '70 Esch Point', 'Phoenix', 'AZ');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (3, '48321 Sycamore Road', 'Fort Worth', 'TX');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (4, '54 Sunnyside Road', 'Montgomery', 'AL');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (5, '69 Cambridge Terrace', 'Washington', 'DC');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (6, '85 Harper Place', 'Dallas', 'TX');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (7, '25 Carpenter Lane', 'Birmingham', 'AL');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (8, '277 Wayridge Avenue', 'Seattle', 'WA');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (9, '48057 Bunting Drive', 'New Haven', 'CT');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (10, '1519 Pankratz Trail', 'Saint Louis', 'MO');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (11, '912 Buell Street', 'Brooklyn', 'NY');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (12, '53382 Westerfield Road', 'Fresno', 'CA');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (13, '36453 Mesta Terrace', 'Youngstown', 'OH');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (14, '8572 Melby Lane', 'Honolulu', 'HI');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (15, '752 Debs Drive', 'Chicago', 'IL');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (16, '4049 Armistice Pass', 'Abilene', 'TX');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (17, '2 Nelson Way', 'New Orleans', 'LA');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (18, '0089 Buhler Plaza', 'Dallas', 'TX');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (19, '9 Duke Crossing', 'Oceanside', 'CA');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (20, '142 Arrowood Way', 'Pasadena', 'CA');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (21, '3 Parkside Park', 'Shawnee Mission', 'KS');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (22, '0 Veith Lane', 'Oklahoma City', 'OK');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (23, '02 Buena Vista Circle', 'Portland', 'OR');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (24, '87 Spenser Crossing', 'Dayton', 'OH');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (25, '20 Oriole Court', 'Akron', 'OH');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (26, '85 Mosinee Junction', 'Lancaster', 'PA');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (27, '1 Farmco Lane', 'Richmond', 'VA');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (28, '860 Steensland Drive', 'Arlington', 'VA');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (29, '23014 Messerschmidt Place', 'Houston', 'TX');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (30, '63 Hermina Drive', 'Denver', 'CO');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (31, '608 Luster Lane', 'Omaha', 'NE');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (32, '77 Dapin Plaza', 'Fayetteville', 'NC');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (33, '003 Bartillon Hill', 'Tampa', 'FL');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (34, '9007 Cambridge Circle', 'Alpharetta', 'GA');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (35, '52783 Blaine Lane', 'Tuscaloosa', 'AL');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (36, '4 Oak Valley Terrace', 'Raleigh', 'NC');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (37, '760 Saint Paul Lane', 'Canton', 'OH');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (38, '52 Mitchell Alley', 'San Diego', 'CA');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (39, '7376 Union Court', 'Las Vegas', 'NV');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (40, '23 Dwight Trail', 'El Paso', 'TX');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (41, '62840 Hallows Point', 'Jacksonville', 'FL');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (42, '704 Burrows Parkway', 'Milwaukee', 'WI');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (43, '28 Oakridge Way', 'Indianapolis', 'IN');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (44, '515 Coleman Lane', 'Washington', 'DC');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (45, '060 Monica Plaza', 'Inglewood', 'CA');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (46, '8568 Spaight Junction', 'Sacramento', 'CA');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (47, '09 Bonner Trail', 'Springfield', 'IL');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (48, '0307 Thierer Lane', 'Warren', 'MI');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (49, '4 Anzinger Pass', 'Honolulu', 'HI');
insert into Company_Addresses (CompanyAddressID, Street, City, State) values (50, '6 Lerdahl Park', 'Pittsburgh', 'PA');


-- Company

insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (1, 'Ortiz-Miller', 7373727, 'Business Services', 'Greece', 1);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (2, 'Ortiz, Mante and Barton', 9477554, 'Television Services', 'Philippines', 2);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (3, 'Mayer Group', 6887294, 'n/a', 'Ireland', 3);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (4, 'Rath-Dietrich', 6405082, 'Hospital/Nursing Management', 'Philippines', 4);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (5, 'Kirlin, Grady and Block', 5039666, 'Television Services', 'Uzbekistan', 5);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (6, 'Hilpert-McClure', 4674216, 'n/a', 'Pakistan', 6);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (7, 'Grant Group', 2088120, 'n/a', 'Italy', 7);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (8, 'Bashirian, Upton and Padberg', 8787360, 'Farming/Seeds/Milling', 'Peru', 8);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (9, 'Waters, Jakubowski and Beer', 9809098, 'n/a', 'Russia', 9);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (10, 'Kris and Sons', 5378525, 'EDP Services', 'Azerbaijan', 10);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (11, 'Goldner, Pacocha and Hintz', 7450781, 'n/a', 'Uzbekistan', 11);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (12, 'Kertzmann and Sons', 6867371, 'Business Services', 'Indonesia', 12);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (13, 'Streich, Zemlak and Bernier', 9820872, 'n/a', 'Philippines', 13);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (14, 'Murazik-Blanda', 6857186, 'Trucking Freight/Courier Services', 'Indonesia', 14);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (15, 'Vandervort, Collins and Rath', 9172374, 'n/a', 'Indonesia', 15);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (16, 'MacGyver, Reilly and O''Conner', 7926910, 'Other Consumer Services', 'Indonesia', 16);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (17, 'Nitzsche LLC', 6995252, 'Broadcasting', 'Portugal', 17);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (18, 'Sipes, Walker and Blick', 3140623, 'Major Banks', 'Indonesia', 18);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (19, 'Nicolas-Kessler', 9922118, 'EDP Services', 'Vietnam', 19);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (20, 'Mertz, Friesen and Lueilwitz', 953023, 'Apparel', 'Indonesia', 20);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (21, 'Marquardt, Lindgren and Jast', 4384740, 'Business Services', 'Portugal', 21);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (22, 'Wintheiser and Sons', 9338710, 'n/a', 'Kazakhstan', 22);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (23, 'Weimann-Little', 6862068, 'n/a', 'China', 23);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (24, 'Jakubowski and Sons', 9571981, 'Major Banks', 'China', 24);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (25, 'Pfeffer-Windler', 1797395, 'Environmental Services', 'United States', 25);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (26, 'Cassin and Sons', 7055575, 'Business Services', 'Ukraine', 26);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (27, 'Rath-Kulas', 314215, 'Major Banks', 'Indonesia', 27);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (28, 'Conroy-Roob', 8592875, 'Finance: Consumer Services', 'China', 28);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (29, 'Moen and Sons', 708471, 'Finance: Consumer Services', 'Portugal', 29);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (30, 'Robel-Cummerata', 9703525, 'Oil & Gas Production', 'Chile', 30);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (31, 'Swaniawski-Schumm', 69831, 'Metal Fabrications', 'Iran', 31);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (32, 'Rippin-Hilpert', 8192159, 'Building Materials', 'Sweden', 32);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (33, 'Stark Inc', 7769403, 'Marine Transportation', 'Indonesia', 33);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (34, 'Bashirian Inc', 7291550, 'Services-Misc. Amusement & Recreation', 'Indonesia', 34);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (35, 'Cruickshank, Davis and Orn', 5556308, 'Natural Gas Distribution', 'Mexico', 35);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (36, 'Russel-Wyman', 6812527, 'Biotechnology', 'Greece', 36);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (37, 'Durgan-Moen', 3991434, 'n/a', 'Brazil', 37);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (38, 'Baumbach-Kessler', 5846793, 'n/a', 'Brazil', 38);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (39, 'Stehr and Sons', 8008889, 'n/a', 'Ukraine', 39);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (40, 'Harris-Reilly', 4764537, 'Clothing/Shoe/Accessory Stores', 'Russia', 40);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (41, 'Fisher and Sons', 1448682, 'EDP Services', 'Russia', 41);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (42, 'Rath-McDermott', 8573862, 'n/a', 'Portugal', 42);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (43, 'O''Kon Inc', 881051, 'Specialty Insurers', 'Dominica', 43);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (44, 'Sipes, Hettinger and Fahey', 9019660, 'Major Pharmaceuticals', 'China', 44);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (45, 'Bogisich, Hane and O''Kon', 2632453, 'Diversified Commercial Services', 'China', 45);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (46, 'Mohr, Wolf and Hirthe', 8590983, 'n/a', 'Tanzania', 46);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (47, 'Kuphal LLC', 9102074, 'Savings Institutions', 'Cape Verde', 47);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (48, 'MacGyver-Osinski', 9707596, 'Medical/Dental Instruments', 'Ukraine', 48);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (49, 'Mayert Inc', 2150295, 'Oil/Gas Transmission', 'Russia', 49);
insert into Company (CompanyID, Name, Size, Industry, Country, CompanyAddressID) values (50, 'Nolan and Sons', 9339222, 'n/a', 'Finland', 50);

-- Revenue

insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (1, '$141701753.44', '$353390148.31', '$269290762.43', '$647212853.02', '$958559598.57');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (2, '$3667305.09', '$795638497.64', '$339229640.15', '$450618327.72', '$434667959.15');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (3, '$15271235.33', '$944804594.77', '$218384506.56', '$879068481.30', '$669352711.69');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (4, '$122707214.11', '$571049330.39', '$887752674.82', '$735660753.67', '$230242676.14');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (5, '$248576179.64', '$698812254.62', '$839792207.48', '$880246270.50', '$260251260.37');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (6, '$631693550.52', '$414730662.02', '$221913504.57', '$434145215.02', '$411790563.16');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (7, '$648474612.99', '$402725407.05', '$621874608.20', '$549806878.60', '$496653681.87');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (8, '$286575395.39', '$307099172.21', '$374736853.97', '$957532396.58', '$974870196.43');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (9, '$279586244.05', '$817570916.34', '$841236610.36', '$794116662.32', '$704603549.50');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (10, '$675105984.61', '$647153838.14', '$521306349.13', '$976844523.92', '$373641439.90');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (11, '$54104033.93', '$535705335.91', '$593557562.30', '$885773908.14', '$597050142.81');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (12, '$728656753.44', '$759209325.13', '$805445619.28', '$793957091.60', '$22381099.81');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (13, '$33330203.63', '$919643617.58', '$348940561.64', '$333851671.50', '$365117401.58');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (14, '$27948175.55', '$211232197.30', '$757635655.58', '$828115318.45', '$904340961.34');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (15, '$369878993.61', '$140361665.04', '$886468632.73', '$214553003.69', '$753144144.29');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (16, '$133751724.58', '$377581442.36', '$135634916.03', '$226833461.94', '$136256367.79');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (17, '$15667910.19', '$888837024.41', '$818865271.96', '$693726583.85', '$800477674.23');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (18, '$219237325.90', '$899616371.92', '$370363322.42', '$641131055.19', '$63682615.22');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (19, '$382699175.47', '$128518786.69', '$129569469.52', '$642598061.18', '$675416065.24');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (20, '$622661390.30', '$134862789.29', '$499231266.87', '$93342098.32', '$144498076.64');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (21, '$494768306.05', '$139281120.12', '$801697780.51', '$627040447.99', '$641669582.90');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (22, '$651229203.28', '$98676504.38', '$988526346.15', '$890647176.68', '$909255757.87');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (23, '$590552517.85', '$537006202.59', '$986552949.54', '$496274006.16', '$419446100.84');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (24, '$858135461.47', '$993984358.64', '$299346024.33', '$45120461.48', '$970740387.58');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (25, '$508401626.47', '$374092285.03', '$672757008.09', '$893921387.11', '$854379257.56');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (26, '$55451780.55', '$871744765.36', '$267609749.53', '$723203529.18', '$968905680.63');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (27, '$519213488.59', '$681294622.26', '$500543928.74', '$14949938.93', '$427682984.87');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (28, '$108238818.80', '$348044803.64', '$341177451.64', '$75251307.33', '$123858607.12');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (29, '$316405362.16', '$656272033.09', '$878975501.63', '$806453726.16', '$142124586.59');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (30, '$540157941.41', '$206736297.08', '$543212094.79', '$363220877.70', '$16742663.91');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (31, '$583972338.02', '$489691827.72', '$772327945.77', '$249144790.47', '$935157550.69');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (32, '$692995584.15', '$386735091.42', '$217986796.93', '$136132409.55', '$662786342.00');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (33, '$981235568.63', '$361237794.00', '$463755851.66', '$740244449.55', '$845462993.11');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (34, '$744062455.89', '$232976775.06', '$291634800.10', '$291460528.81', '$360681098.56');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (35, '$878483059.45', '$661497404.17', '$581743635.38', '$425036769.17', '$243288912.42');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (36, '$536682247.72', '$680868426.67', '$917994985.98', '$748514724.85', '$827386887.76');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (37, '$883656123.04', '$382246072.62', '$779900021.55', '$985321978.76', '$971234820.05');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (38, '$145589106.61', '$468125710.09', '$102798037.17', '$218758842.42', '$214268946.83');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (39, '$867351636.55', '$491852935.06', '$933246393.90', '$735199461.96', '$893798072.43');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (40, '$336376149.68', '$332818958.39', '$42665193.82', '$315516646.91', '$433108069.33');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (41, '$438677192.06', '$329877643.87', '$139212904.27', '$243999077.84', '$417865097.63');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (42, '$305079278.81', '$530803158.16', '$675096776.99', '$367740195.60', '$774984873.87');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (43, '$316322536.71', '$817698331.97', '$348775797.15', '$722762760.72', '$363091577.63');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (44, '$835622382.57', '$152840575.02', '$570979582.24', '$411847408.91', '$859356917.51');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (45, '$421003676.51', '$756178027.65', '$281741600.52', '$923463188.10', '$835613434.67');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (46, '$344259202.59', '$839509081.11', '$328744152.83', '$642466709.21', '$312989206.02');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (47, '$14477187.92', '$712848508.25', '$826421868.02', '$634808305.33', '$479565053.35');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (48, '$569110666.69', '$411677619.54', '$513047568.09', '$509327154.46', '$885345021.71');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (49, '$83933121.68', '$240816695.75', '$466592473.49', '$649466287.72', '$797754158.80');
insert into Revenue (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (50, '$530156714.11', '$320390434.81', '$149170224.99', '$413911667.28', '$616593853.92');

-- Market share

insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (1, 11.5, 11.82, 20.79, 0.6, 47.57);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (2, 7.9, 41.77, 1.43, 17.18, 14.95);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (3, 29.76, 45.06, 37.29, 41.63, 42.87);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (4, 18.81, 16.67, 29.46, 28.81, 20.59);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (5, 13.38, 26.61, 3.42, 42.67, 21.67);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (6, 17.79, 20.94, 7.65, 35.53, 32.8);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (7, 20.8, 18.32, 22.21, 13.95, 0.82);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (8, 41.03, 11.49, 22.04, 23.39, 0.33);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (9, 20.38, 7.39, 19.48, 33.84, 13.62);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (10, 27.04, 30.15, 1.08, 8.91, 7.63);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (11, 11.51, 26.45, 22.21, 15.05, 3.53);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (12, 18.96, 33.84, 45.1, 26.17, 45.12);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (13, 46.93, 38.29, 25.55, 17.97, 7.8);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (14, 40.79, 20.75, 5.83, 18.46, 45.78);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (15, 33.34, 32.96, 26.07, 2.57, 22.18);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (16, 37.02, 33.09, 32.3, 18.33, 22.58);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (17, 6.12, 33.39, 18.5, 11.05, 17.03);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (18, 35.16, 8.55, 38.49, 17.55, 19.39);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (19, 23.18, 40.97, 41.44, 42.34, 29.89);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (20, 1.89, 12.84, 43.46, 2.23, 7.1);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (21, 12.42, 12.56, 42.98, 35.9, 17.01);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (22, 6.88, 10.35, 15.19, 16.9, 34.4);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (23, 27.77, 35.17, 18.14, 2.51, 2.59);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (24, 6.35, 45.83, 39.07, 37.7, 17.72);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (25, 27.47, 17.63, 46.87, 39.35, 17.26);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (26, 44.06, 35.84, 26.12, 11.81, 37.57);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (27, 5.35, 43.13, 23.47, 46.56, 13.58);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (28, 33.03, 15.04, 19.36, 42.46, 8.72);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (29, 19.58, 1.99, 0.92, 0.15, 17.55);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (30, 4.3, 21.65, 3.77, 46.83, 14.46);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (31, 31.46, 30.59, 46.05, 6.3, 46.11);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (32, 14.07, 28.24, 18.55, 29.3, 29.56);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (33, 19.17, 40.19, 1.07, 30.95, 12.62);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (34, 40.03, 28.52, 30.81, 4.34, 20.97);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (35, 40.95, 4.59, 11.77, 26.79, 24.56);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (36, 27.6, 35.95, 1.32, 13.24, 45.04);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (37, 37.59, 47.79, 4.03, 31.55, 16.72);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (38, 43.8, 11.25, 28.32, 9.75, 31.6);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (39, 30.06, 21.06, 45.84, 3.35, 36.53);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (40, 16.45, 25.66, 40.02, 47.94, 19.7);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (41, 26.99, 39.51, 39.13, 30.4, 15.72);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (42, 1.07, 11.66, 41.69, 16.19, 6.61);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (43, 48.64, 3.82, 8.77, 8.69, 41.14);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (44, 21.83, 1.44, 31.24, 24.55, 48.95);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (45, 25.74, 46.85, 42.21, 38.74, 48.37);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (46, 28.09, 13.95, 10.63, 16.52, 5.72);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (47, 8.35, 12.18, 26.0, 9.45, 9.99);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (48, 18.28, 1.99, 46.93, 12.46, 47.61);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (49, 36.06, 19.67, 25.39, 0.65, 4.31);
insert into Market_Share (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (50, 22.95, 46.52, 45.59, 19.78, 32.38);

-- Profit

insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (1, '$67816700.21', '$6918105.48', '$24078669.47', '$95396576.36', '$35842677.26');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (2, '$644580.49', '$51168018.66', '$82116542.22', '$285386.16', '$84022535.90');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (3, '$34509880.96', '$93434120.69', '$2239316.49', '$93796636.61', '$91250686.49');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (4, '$85802673.70', '$15555561.96', '$67210711.49', '$5560011.67', '$31758603.72');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (5, '$40828803.72', '$1069328.41', '$72568665.75', '$69313373.89', '$88349586.89');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (6, '$83279215.00', '$86752367.71', '$82194269.22', '$86223385.11', '$47534784.63');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (7, '$29470572.07', '$26855217.45', '$36666528.39', '$86990379.39', '$8507793.28');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (8, '$78064952.07', '$85959368.79', '$52042411.51', '$68165683.00', '$21132983.32');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (9, '$31064717.58', '$77115740.85', '$6264840.40', '$89269338.07', '$19554320.94');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (10, '$3147098.15', '$40698524.22', '$78116312.31', '$77280550.38', '$63405100.78');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (11, '$93674426.96', '$93332455.91', '$85817301.73', '$52614030.14', '$36768212.05');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (12, '$69304855.61', '$38059162.25', '$91317399.03', '$79034229.64', '$94846723.20');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (13, '$27390532.79', '$32069936.54', '$50175505.11', '$50737728.56', '$17901870.59');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (14, '$69299240.19', '$44456499.18', '$49055775.22', '$29555480.62', '$44355091.05');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (15, '$54564771.92', '$13088397.15', '$31901625.40', '$80371043.56', '$1752784.39');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (16, '$72900562.83', '$73164719.90', '$44321434.10', '$53485534.39', '$10942378.45');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (17, '$27247068.18', '$7864022.07', '$8771787.92', '$65324541.59', '$60267041.11');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (18, '$94304488.12', '$89199207.61', '$22584309.39', '$959941.50', '$98570361.48');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (19, '$88796500.34', '$1823564.91', '$22799481.64', '$81263911.76', '$26937454.70');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (20, '$20587964.14', '$15843467.74', '$83238738.90', '$63163165.72', '$25325686.41');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (21, '$53322905.61', '$33172764.84', '$27081194.15', '$15105958.73', '$14170946.83');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (22, '$77803461.51', '$38841732.70', '$54421924.90', '$40449830.10', '$65509495.38');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (23, '$58830069.62', '$71184076.72', '$15641910.42', '$22247958.44', '$33717979.71');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (24, '$98426003.34', '$40057018.69', '$90917931.39', '$35168862.71', '$72024490.70');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (25, '$77276797.91', '$33846043.07', '$46131732.61', '$45168666.03', '$15334814.95');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (26, '$90048132.52', '$56438873.38', '$44975186.33', '$7549599.37', '$11615627.54');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (27, '$54009224.03', '$93659005.45', '$35547132.37', '$24796741.09', '$79856229.68');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (28, '$92090534.87', '$35291941.02', '$51473225.77', '$40549972.18', '$874163.03');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (29, '$83980503.51', '$8112687.76', '$35946749.40', '$49945892.49', '$22421990.03');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (30, '$84840837.95', '$32002806.23', '$76173167.15', '$60349996.11', '$11199415.32');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (31, '$94334115.42', '$85234351.47', '$70617122.89', '$8842245.59', '$49105696.35');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (32, '$24406544.75', '$65839343.11', '$78675055.49', '$71937606.54', '$47759068.83');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (33, '$45906834.47', '$22942652.53', '$80866291.96', '$25220808.65', '$39591546.33');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (34, '$26291391.91', '$15625905.50', '$27268763.99', '$64795402.38', '$76548735.04');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (35, '$77507386.12', '$92105578.56', '$88104860.41', '$48943667.73', '$44949392.08');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (36, '$3473579.78', '$36317602.66', '$72685300.68', '$37496346.06', '$46374652.58');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (37, '$5961315.41', '$93530145.67', '$27060155.63', '$54626069.59', '$39078450.00');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (38, '$44677950.70', '$93830203.77', '$95315030.21', '$15435106.77', '$48587571.25');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (39, '$29907004.59', '$23548115.70', '$3460680.63', '$6806673.51', '$23037288.94');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (40, '$24293752.89', '$8702341.70', '$82023816.91', '$78583080.94', '$65528920.78');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (41, '$11851514.10', '$16374240.47', '$89190742.93', '$85511230.09', '$79860905.87');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (42, '$84378894.89', '$80191095.02', '$43142302.53', '$47274529.45', '$89456357.32');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (43, '$59815741.93', '$31735138.30', '$14898280.03', '$80235443.56', '$90275666.20');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (44, '$87119070.07', '$66071095.76', '$28506036.35', '$57310016.90', '$88300971.48');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (45, '$32267656.77', '$70578241.90', '$7474165.95', '$13202155.16', '$56336626.09');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (46, '$35184622.41', '$66613561.98', '$61640691.08', '$27748256.36', '$62776418.21');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (47, '$87171601.60', '$67944286.32', '$87954106.11', '$96170139.96', '$80370556.75');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (48, '$96645852.21', '$79807160.31', '$591931.69', '$32788526.45', '$24454767.98');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (49, '$64806236.65', '$11958445.29', '$85770052.49', '$51454874.06', '$48635377.64');
insert into Profit (CompanyID, `2017`, `2018`, `2019`, `2020`, `2021`) values (50, '$7736021.53', '$75157552.06', '$78594755.36', '$96770817.91', '$46396493.19');

-- Stocks

insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (1, 'HZNP', 887, 1603, 41, '$69.53', '$362.11', '$231.45', '2022-10-31');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (2, 'SDT', 6099, 1620, 20, '$82.87', '$320.43', '$236.28', '2022-02-24');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (3, 'CPTAG', 5578, 1574, 61, '$28.97', '$386.36', '$224.66', '2022-10-24');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (4, 'ICL', 4360, 878, 64, '$20.70', '$309.21', '$132.51', '2022-05-04');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (5, 'PPC', 8371, 329, 99, '$67.72', '$301.85', '$262.54', '2021-12-29');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (6, 'AUPH', 3052, 1417, 56, '$45.74', '$393.57', '$210.05', '2022-05-18');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (7, 'STE', 5475, 604, 75, '$34.59', '$398.01', '$207.28', '2022-03-06');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (8, 'IRET', 141, 1241, 34, '$20.27', '$327.73', '$183.54', '2021-12-17');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (9, 'CBF', 787, 843, 42, '$75.66', '$335.40', '$263.38', '2022-01-17');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (10, 'FSM', 8085, 1973, 81, '$13.96', '$397.37', '$287.02', '2022-09-30');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (11, 'ZBRA', 2534, 370, 68, '$69.11', '$337.30', '$158.34', '2022-05-18');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (12, 'SSW', 5784, 42, 29, '$56.91', '$373.10', '$197.50', '2022-04-11');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (13, 'NAN', 1952, 1138, 48, '$12.31', '$301.95', '$261.70', '2022-09-25');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (14, 'FISV', 5144, 1727, 13, '$79.60', '$392.96', '$230.52', '2022-04-27');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (15, 'CEL', 9609, 688, 18, '$22.93', '$355.37', '$175.61', '2021-12-18');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (16, 'KYO', 8747, 1653, 43, '$10.84', '$385.58', '$151.96', '2022-11-01');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (17, 'JNPR', 7841, 1354, 9, '$13.56', '$319.64', '$185.59', '2021-12-18');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (18, 'ICUI', 7008, 406, 96, '$25.49', '$341.94', '$215.93', '2022-04-08');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (19, 'HDP', 6793, 1976, 39, '$2.87', '$364.05', '$246.14', '2022-10-20');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (20, 'SLCA', 6703, 1049, 32, '$66.43', '$310.01', '$139.29', '2022-10-24');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (21, 'QCRH', 8675, 1951, 65, '$58.09', '$391.92', '$278.38', '2022-06-19');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (22, 'MDT', 5527, 1421, 43, '$21.11', '$363.28', '$247.40', '2022-08-20');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (23, 'MPAA', 1261, 1580, 23, '$71.72', '$308.50', '$165.77', '2022-07-22');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (24, 'ASB^C', 7800, 1959, 87, '$64.34', '$308.23', '$262.65', '2022-09-30');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (25, 'ASB', 7973, 843, 6, '$46.80', '$341.57', '$206.12', '2022-08-21');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (26, 'VNO^I', 2894, 1345, 80, '$97.85', '$316.63', '$233.12', '2022-04-27');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (27, 'ESV', 9869, 134, 74, '$16.11', '$356.50', '$284.68', '2022-06-04');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (28, 'DLTR', 9453, 796, 44, '$98.24', '$337.20', '$190.90', '2022-11-12');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (29, 'ASV', 9185, 98, 69, '$17.84', '$390.07', '$112.66', '2022-09-28');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (30, 'PNFP', 4860, 687, 52, '$86.76', '$370.00', '$271.28', '2022-04-27');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (31, 'FLC', 40, 151, 41, '$45.06', '$330.31', '$282.13', '2022-04-16');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (32, 'EVGN', 9585, 1588, 67, '$8.78', '$380.66', '$210.42', '2021-12-02');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (33, 'TSRO', 6367, 72, 78, '$56.14', '$397.10', '$105.59', '2022-10-29');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (34, 'SGRY', 4860, 73, 12, '$70.81', '$313.64', '$111.01', '2022-04-23');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (35, 'MSCI', 8475, 262, 3, '$5.40', '$394.56', '$113.50', '2022-10-06');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (36, 'RDCM', 2022, 1120, 54, '$41.53', '$301.14', '$118.99', '2022-07-14');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (37, 'FALN', 7510, 1420, 52, '$15.12', '$332.73', '$234.66', '2022-02-28');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (38, 'PPH', 3466, 1061, 9, '$80.14', '$351.53', '$225.68', '2022-01-08');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (39, 'SO', 2768, 283, 57, '$58.27', '$357.19', '$103.47', '2022-07-23');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (40, 'CDK', 6156, 85, 35, '$7.51', '$300.06', '$217.50', '2022-04-29');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (41, 'ADTN', 353, 622, 37, '$73.80', '$373.74', '$279.44', '2022-02-23');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (42, 'PBSK', 8930, 1699, 51, '$80.79', '$353.71', '$156.16', '2022-05-22');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (43, 'FLIR', 1584, 931, 54, '$86.20', '$380.61', '$292.16', '2022-08-14');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (44, 'G', 1540, 1323, 43, '$75.23', '$368.52', '$109.99', '2022-03-02');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (45, 'CHSCP', 9901, 1199, 29, '$55.85', '$339.42', '$278.31', '2022-06-02');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (46, 'STN', 2684, 1826, 73, '$4.91', '$339.66', '$159.50', '2022-09-22');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (47, 'KAACU', 5342, 1913, 59, '$32.61', '$345.82', '$251.12', '2022-08-26');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (48, 'GAB^D', 1054, 1845, 7, '$10.33', '$364.05', '$259.58', '2022-11-12');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (49, 'OCLR', 3784, 1271, 31, '$55.57', '$336.32', '$110.99', '2022-03-08');
insert into Stock (StockID, Name, QuantityAvailable, PurchaseLimit, QuantitySold, PriceMin, PriceMax, CurrPrice, DateListed) values (50, 'GEO', 4501, 1353, 13, '$80.06', '$369.14', '$191.77', '2022-10-15');

-- Admin addresses

insert into Admin_Addresses (AdminAddressID, Street, City, State) values (1, '70 Moland Point', 'Houston', 'TX');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (2, '95049 Hallows Terrace', 'Fresno', 'CA');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (3, '3623 Merrick Park', 'Pittsburgh', 'PA');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (4, '74211 Mesta Avenue', 'Detroit', 'MI');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (5, '5 Crescent Oaks Road', 'Fort Myers', 'FL');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (6, '243 5th Hill', 'Tampa', 'FL');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (7, '5 Brentwood Lane', 'Lynchburg', 'VA');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (8, '04 Donald Plaza', 'San Diego', 'CA');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (9, '4958 Beilfuss Place', 'Los Angeles', 'CA');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (10, '564 Scott Drive', 'Saint Petersburg', 'FL');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (11, '3494 Hoffman Point', 'Delray Beach', 'FL');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (12, '3856 Randy Point', 'Oklahoma City', 'OK');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (13, '2 Arapahoe Junction', 'Palatine', 'IL');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (14, '8 Charing Cross Pass', 'Champaign', 'IL');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (15, '204 Rutledge Road', 'Odessa', 'TX');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (16, '2795 Canary Parkway', 'Fairfield', 'CT');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (17, '735 Spenser Crossing', 'Brooklyn', 'NY');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (18, '41265 Hauk Drive', 'Providence', 'RI');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (19, '7162 Oxford Lane', 'Buffalo', 'NY');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (20, '31 4th Court', 'Oakland', 'CA');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (21, '51 Graceland Place', 'Oklahoma City', 'OK');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (22, '767 Mallard Parkway', 'Denver', 'CO');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (23, '013 Melvin Alley', 'Anniston', 'AL');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (24, '0 Carpenter Pass', 'Chesapeake', 'VA');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (25, '04092 Northfield Hill', 'Tacoma', 'WA');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (26, '2432 Maryland Way', 'Duluth', 'GA');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (27, '37726 Tennessee Point', 'Austin', 'TX');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (28, '8 Burrows Court', 'Las Vegas', 'NV');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (29, '05982 Meadow Valley Center', 'Houston', 'TX');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (30, '667 Mesta Street', 'Cincinnati', 'OH');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (31, '4 Anhalt Point', 'Harrisburg', 'PA');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (32, '66869 Dayton Alley', 'Grand Rapids', 'MI');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (33, '356 Randy Parkway', 'Philadelphia', 'PA');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (34, '5743 Bartillon Hill', 'New Orleans', 'LA');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (35, '319 Menomonie Lane', 'Jacksonville', 'FL');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (36, '84 Harbort Park', 'Houston', 'TX');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (37, '945 Manley Parkway', 'Miami', 'FL');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (38, '057 Trailsway Road', 'Irving', 'TX');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (39, '813 Anhalt Avenue', 'Newport News', 'VA');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (40, '3 Forest Dale Road', 'Boulder', 'CO');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (41, '18 Main Plaza', 'Fort Worth', 'TX');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (42, '0685 Annamark Point', 'Glendale', 'AZ');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (43, '05492 Toban Plaza', 'Seattle', 'WA');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (44, '60 Gale Circle', 'Jamaica', 'NY');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (45, '5 Bluestem Lane', 'Aiken', 'SC');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (46, '94 Artisan Crossing', 'Irvine', 'CA');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (47, '654 High Crossing Crossing', 'Indianapolis', 'IN');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (48, '97676 Mockingbird Point', 'San Jose', 'CA');
insert into Admin_Addresses (AdminAddressID, Street, City, State) values (49, '6 Claremont Center', 'New York City', 'NY');
insert into Admin_Addresses (AdminAddressID, Street, City, State)values (50, '72020 Sheridan Road', 'San Antonio', 'TX');

-- Admin

insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (1, 'Marje', 'Fyrth', 'mfyrth0@people.com.cn', '(917) 9600106', 'Speech Pathologist', '1973-05-10', 1);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (2, 'Taddeusz', 'De Bruijne', 'tdebruijne1@illinois.edu', '(703) 5277227', 'Tax Accountant', '1995-12-15', 2);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (3, 'Amabelle', 'Dawks', 'adawks2@cnbc.com', '(468) 8288519', 'Recruiting Manager', '1996-08-20', 3);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (4, 'Briny', 'Darben', 'bdarben3@kickstarter.com', '(260) 3456926', 'Geological Engineer', '1985-02-06', 4);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (5, 'Alika', 'Spires', 'aspires4@comsenz.com', '(482) 5966054', 'Librarian', '1998-04-10', 5);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (6, 'Candida', 'Francom', 'cfrancom5@miibeian.gov.cn', '(107) 1022541', 'VP Marketing', '1996-05-21', 6);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (7, 'Dell', 'Shelmardine', 'dshelmardine6@google.ca', '(153) 1228697', 'Cost Accountant', '1986-09-03', 7);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (8, 'Angelina', 'Fromont', 'afromont7@hao123.com', '(201) 3931930', 'Health Coach II', '1995-03-04', 8);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (9, 'Reinwald', 'Korf', 'rkorf8@paypal.com', '(280) 7940851', 'Graphic Designer', '1970-03-21', 9);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (10, 'Bibbie', 'Lauchlan', 'blauchlan9@mozilla.org', '(345) 3022785', 'Operator', '1991-08-12', 10);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (11, 'Rosaline', 'Parades', 'rparadesa@dmoz.org', '(710) 4844043', 'VP Sales', '2000-01-22', 11);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (12, 'Gustav', 'Blasik', 'gblasikb@stanford.edu', '(447) 4493255', 'Librarian', '1985-06-22', 12);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (13, 'Luis', 'Schrieves', 'lschrievesc@gizmodo.com', '(994) 1465786', 'Pharmacist', '1991-05-11', 13);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (14, 'Bartel', 'Rosenbloom', 'brosenbloomd@edublogs.org', '(790) 8389042', 'Desktop Support Technician', '1993-06-11', 14);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (15, 'Beverlie', 'Dallywater', 'bdallywatere@ebay.co.uk', '(795) 2842389', 'Social Worker', '1985-05-15', 15);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (16, 'Stearne', 'Levane', 'slevanef@disqus.com', '(145) 8900590', 'Quality Engineer', '1996-06-20', 16);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (17, 'Clea', 'Coggins', 'ccogginsg@ucoz.com', '(259) 3938195', 'Senior Cost Accountant', '2001-01-13', 17);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (18, 'Marinna', 'Wem', 'mwemh@drupal.org', '(917) 2330856', 'VP Quality Control', '1985-05-21', 18);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (19, 'Obed', 'Torns', 'otornsi@t-online.de', '(763) 3259389', 'Editor', '1988-12-03', 19);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (20, 'Alidia', 'Sproule', 'asproulej@1und1.de', '(636) 4980281', 'Accountant III', '2000-05-06', 20);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (21, 'Nerta', 'Rose', 'nrosek@cisco.com', '(332) 9011526', 'Database Administrator I', '1973-07-21', 21);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (22, 'Dalt', 'Callam', 'dcallaml@jigsy.com', '(891) 9322207', 'Registered Nurse', '1982-10-02', 22);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (23, 'Enriqueta', 'Woollons', 'ewoollonsm@google.nl', '(295) 6783617', 'Human Resources Manager', '1993-01-03', 23);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (24, 'Melisse', 'Carlozzi', 'mcarlozzin@dmoz.org', '(570) 3851709', 'Nurse Practicioner', '1972-01-26', 24);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (25, 'Shoshanna', 'Crandon', 'scrandono@ucoz.com', '(943) 3339003', 'Account Coordinator', '1999-07-24', 25);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (26, 'Trudy', 'Hawkyens', 'thawkyensp@123-reg.co.uk', '(608) 3554583', 'Staff Scientist', '1977-07-19', 26);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (27, 'Grantham', 'Wallington', 'gwallingtonq@google.es', '(947) 1633034', 'Professor', '1983-01-06', 27);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (28, 'Reuben', 'Rennebeck', 'rrennebeckr@nifty.com', '(958) 2184622', 'Human Resources Manager', '1976-11-03', 28);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (29, 'Toma', 'Cornewell', 'tcornewells@dion.ne.jp', '(674) 4253684', 'Data Coordiator', '1972-02-27', 29);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (30, 'Loralyn', 'Godney', 'lgodneyt@youku.com', '(585) 9078170', 'Human Resources Assistant I', '1984-07-28', 30);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (31, 'Nichols', 'Eplate', 'neplateu@odnoklassniki.ru', '(889) 8049860', 'Web Designer II', '1985-06-16', 31);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (32, 'Margaretta', 'Brooksby', 'mbrooksbyv@google.com.br', '(723) 7859252', 'Librarian', '1974-01-26', 32);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (33, 'Ignaz', 'Galtone', 'igaltonew@meetup.com', '(724) 4827340', 'Analyst Programmer', '1983-11-09', 33);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (34, 'Janaye', 'Nawton', 'jnawtonx@typepad.com', '(258) 3380489', 'Teacher', '1995-09-08', 34);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (35, 'Darwin', 'Hasker', 'dhaskery@google.com.au', '(441) 6228672', 'Structural Engineer', '1980-07-30', 35);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (36, 'Berkeley', 'Berrill', 'bberrillz@fastcompany.com', '(761) 9016672', 'Geological Engineer', '1980-09-30', 36);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (37, 'Lowe', 'Ebbings', 'lebbings10@163.com', '(509) 2504202', 'Community Outreach Specialist', '1981-12-07', 37);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (38, 'Paddie', 'Olufsen', 'polufsen11@google.ca', '(716) 9622769', 'Quality Engineer', '1976-03-28', 38);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (39, 'Aylmar', 'Celloni', 'acelloni12@gizmodo.com', '(274) 2363212', 'Nurse Practicioner', '1986-12-05', 39);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (40, 'Richmond', 'Dawkes', 'rdawkes13@amazonaws.com', '(178) 3433652', 'VP Marketing', '1972-01-08', 40);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (41, 'Fabien', 'Sanchez', 'fsanchez14@51.la', '(724) 1708273', 'Web Developer II', '1980-03-05', 41);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (42, 'Jandy', 'Minthorpe', 'jminthorpe15@google.com.br', '(227) 8566247', 'Programmer Analyst IV', '1974-12-24', 42);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (43, 'Mamie', 'Wapple', 'mwapple16@ameblo.jp', '(774) 3481324', 'Speech Pathologist', '1975-05-06', 43);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (44, 'Brigitte', 'Preene', 'bpreene17@pcworld.com', '(916) 8264297', 'Software Test Engineer II', '1985-01-23', 44);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (45, 'Constanta', 'Meredith', 'cmeredith18@youtu.be', '(942) 6356840', 'Engineer IV', '1974-01-06', 45);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (46, 'Franciska', 'Frankcomb', 'ffrankcomb19@gmpg.org', '(786) 8795002', 'Legal Assistant', '1979-10-06', 46);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (47, 'Giles', 'Kinkade', 'gkinkade1a@deliciousdays.com', '(695) 4225421', 'Human Resources Manager', '1995-05-26', 47);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (48, 'Starla', 'Scattergood', 'sscattergood1b@quantcast.com', '(421) 9654401', 'Assistant Manager', '1996-11-30', 48);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (49, 'Ellette', 'MacKinnon', 'emackinnon1c@intel.com', '(188) 3784312', 'VP Sales', '2001-03-09', 49);
insert into Admin (EmployeeID, first_name, last_name, email, phone, Title, BirthDate, AdminAddressID) values (50, 'Nolan', 'Tovey', 'ntovey1d@google.com.br', '(192) 9402783', 'Speech Pathologist', '1996-10-17', 50);

-- Customer

insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (1, 'Jarret', 'Mearing', 'jmearing0@blogtalkradio.com', '1916-01-21', 'China', '(189) 5351570', '191-90-6183', '5108750248463531');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (2, 'Claribel', 'Howick', 'chowick1@state.tx.us', '1964-04-24', 'Nauru', '(198) 4549796', '176-56-9641', '5108755397397547');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (3, 'Lefty', 'Dunbleton', 'ldunbleton2@java.com', '2000-07-11', 'Argentina', '(732) 5817218', '443-87-0846', '5108753870164997');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (4, 'Brade', 'Rhymer', 'brhymer3@opensource.org', '1961-10-11', 'United States', '(414) 4190958', '187-03-3751', '5048373639586670');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (5, 'Walther', 'Shera', 'wshera4@shutterfly.com', '1944-10-05', 'United States', '(314) 7709332', '202-01-7221', '5048373504632799');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (6, 'Nobe', 'Keeley', 'nkeeley5@theguardian.com', '1901-05-24', 'Greece', '(425) 2948084', '261-89-2546', '5108752084884606');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (7, 'Michele', 'Swallwell', 'mswallwell6@woothemes.com', '1952-11-17', 'Sweden', '(501) 8794316', '705-12-8048', '5048376749370760');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (8, 'Luci', 'Askin', 'laskin7@reference.com', '1902-11-06', 'Macedonia', '(182) 7412851', '373-36-2576', '5048376945000732');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (9, 'Neel', 'Bewshaw', 'nbewshaw8@pen.io', '1945-04-22', 'China', '(134) 2286630', '557-59-0184', '5048370221341019');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (10, 'Rex', 'Hacquel', 'rhacquel9@reference.com', '1952-07-07', 'Indonesia', '(296) 4760974', '764-82-3492', '5108752461473098');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (11, 'Ronalda', 'Nunes Nabarro', 'rnunesnabarroa@cnet.com', '2002-02-05', 'Brazil', '(966) 5172085', '176-42-1841', '5048374142979873');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (12, 'Florence', 'Noto', 'fnotob@npr.org', '1959-07-25', 'Bangladesh', '(470) 1799483', '616-12-9319', '5048371339153486');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (13, 'Winifred', 'Merrifield', 'wmerrifieldc@skyrock.com', '2003-11-29', 'China', '(543) 9925152', '780-74-6505', '5048375917605999');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (14, 'Sandy', 'Goulbourn', 'sgoulbournd@51.la', '1933-01-20', 'Afghanistan', '(989) 6080847', '687-19-6941', '5108751021056823');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (15, 'Godfry', 'Danilchenko', 'gdanilchenkoe@java.com', '1942-05-14', 'Russia', '(372) 4342482', '605-32-8850', '5048371366532891');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (16, 'Debby', 'Ilbert', 'dilbertf@taobao.com', '1946-03-24', 'Tunisia', '(135) 8387930', '778-85-0988', '5048377370199601');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (17, 'Quintin', 'Scripture', 'qscriptureg@google.com.br', '1982-09-24', 'Bulgaria', '(479) 1230277', '119-84-1556', '5048379552737026');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (18, 'Joice', 'Stiegars', 'jstiegarsh@wufoo.com', '1926-09-10', 'Finland', '(464) 4611343', '303-70-8760', '5108759616384948');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (19, 'Darlleen', 'Cothey', 'dcotheyi@typepad.com', '1940-10-15', 'Pakistan', '(375) 9537142', '226-05-2407', '5108751569399072');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (20, 'Amity', 'Firbanks', 'afirbanksj@tumblr.com', '1924-06-17', 'Argentina', '(364) 3057339', '311-80-7457', '5048376924193532');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (21, 'Bobbette', 'McAvinchey', 'bmcavincheyk@wunderground.com', '1916-08-02', 'Portugal', '(205) 3986155', '322-71-9740', '5048377605985345');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (22, 'Morissa', 'Josephov', 'mjosephovl@netscape.com', '1942-07-08', 'United States', '(907) 3482728', '652-71-5224', '5048371490624291');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (23, 'Phip', 'Genny', 'pgennym@about.com', '1984-06-01', 'Albania', '(159) 4618235', '675-04-6839', '5048378085975475');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (24, 'Zia', 'Freeth', 'zfreethn@posterous.com', '1935-01-23', 'China', '(532) 3703406', '872-90-8152', '5048378924244059');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (25, 'Charmine', 'Koomar', 'ckoomaro@fc2.com', '1920-09-21', 'France', '(920) 6843070', '793-84-4061', '5048377025565503');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (26, 'Leora', 'Patnelli', 'lpatnellip@gnu.org', '1920-03-26', 'Albania', '(756) 1136001', '661-08-9437', '5048377507090806');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (27, 'Ugo', 'Bows', 'ubowsq@4shared.com', '1904-11-30', 'Argentina', '(383) 6175849', '131-09-3585', '5108759717833835');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (28, 'Thorndike', 'Sandercroft', 'tsandercroftr@ustream.tv', '2004-07-04', 'Philippines', '(663) 9154145', '460-46-9094', '5108757700782258');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (29, 'Emilio', 'MacGillavery', 'emacgillaverys@xrea.com', '1993-03-07', 'Thailand', '(415) 2499585', '607-99-2484', '5048376394877622');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (30, 'Kendall', 'Osmant', 'kosmantt@barnesandnoble.com', '1999-07-22', 'Indonesia', '(180) 2214100', '818-83-7556', '5048377675648823');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (31, 'Paulie', 'Renals', 'prenalsu@businessinsider.com', '1993-03-07', 'China', '(270) 1791895', '891-69-9294', '5108756825789099');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (32, 'Hermina', 'Headon', 'hheadonv@nasa.gov', '2002-06-25', 'China', '(588) 7854784', '489-75-6759', '5108753883991204');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (33, 'Sidney', 'Fussen', 'sfussenw@51.la', '1992-09-17', 'Mauritius', '(505) 2944018', '628-54-9207', '5048375438470998');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (34, 'Brig', 'Bevar', 'bbevarx@usa.gov', '1993-01-09', 'Portugal', '(147) 7310672', '580-17-2231', '5048375179654495');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (35, 'Lela', 'Ecclesall', 'lecclesally@163.com', '1913-11-15', 'Canada', '(944) 4401859', '673-20-5669', '5048372242569578');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (36, 'Elmer', 'Rupel', 'erupelz@newyorker.com', '1996-09-29', 'Philippines', '(751) 1367997', '212-87-8513', '5108753329604122');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (37, 'Brigg', 'Winders', 'bwinders10@topsy.com', '1917-12-11', 'Macedonia', '(934) 6643911', '711-78-5594', '5108756589046256');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (38, 'Franchot', 'Snartt', 'fsnartt11@google.com.hk', '1929-03-23', 'Indonesia', '(368) 4495284', '577-60-9365', '5048376078501548');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (39, 'Geneva', 'Braz', 'gbraz12@youtube.com', '1968-06-10', 'Portugal', '(790) 9353246', '765-57-1161', '5048372831143496');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (40, 'Katee', 'Smitheman', 'ksmitheman13@163.com', '1978-10-23', 'China', '(866) 5988125', '874-05-7979', '5048373879616179');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (41, 'Sada', 'Van Bruggen', 'svanbruggen14@chronoengine.com', '1918-03-13', 'China', '(383) 6151834', '443-59-9135', '5048372089395368');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (42, 'Hatti', 'Ballin', 'hballin15@biglobe.ne.jp', '1925-01-05', 'Indonesia', '(782) 5166676', '791-13-1282', '5048377282555791');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (43, 'Lynette', 'Veregan', 'lveregan16@canalblog.com', '1917-10-28', 'Russia', '(841) 7471164', '272-57-2176', '5108750532290749');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (44, 'Salomi', 'Burlingham', 'sburlingham17@netvibes.com', '1992-10-09', 'Colombia', '(378) 8060941', '627-13-7262', '5108751784746537');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (45, 'Sig', 'Rasp', 'srasp18@soundcloud.com', '1924-11-07', 'Indonesia', '(367) 8676877', '549-20-2245', '5048375543206808');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (46, 'Augustine', 'Avrahamov', 'aavrahamov19@google.pl', '1921-06-07', 'Nigeria', '(241) 7491225', '234-62-3522', '5048373198582128');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (47, 'Danella', 'Humber', 'dhumber1a@nydailynews.com', '1951-08-23', 'China', '(562) 4888798', '129-42-2191', '5108758824418258');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (48, 'Chrisy', 'Souza', 'csouza1b@live.com', '1965-10-15', 'Russia', '(626) 6443597', '746-76-2999', '5048376388274299');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (49, 'Othilia', 'Sandyfirth', 'osandyfirth1c@histats.com', '1993-01-22', 'Canada', '(598) 4945753', '238-22-6027', '5108751744015700');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (50, 'Arlina', 'Hamshaw', 'ahamshaw1d@google.cn', '1942-04-06', 'Sweden', '(384) 5904801', '691-73-5899', '5048377268673154');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (51, 'Marcelo', 'Rusk', 'mrusk1e@vkontakte.ru', '1942-04-03', 'New Zealand', '(471) 5034030', '303-57-8751', '5108754032628671');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (52, 'Fernande', 'Kopke', 'fkopke1f@homestead.com', '1968-08-24', 'Philippines', '(671) 4859087', '139-79-5029', '5048371676786641');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (53, 'Jobey', 'Rustman', 'jrustman1g@t-online.de', '1920-07-02', 'Portugal', '(883) 5994891', '841-66-8314', '5048372741986943');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (54, 'Jocelyn', 'Dorro', 'jdorro1h@ox.ac.uk', '1983-09-08', 'Armenia', '(639) 1423395', '568-73-4526', '5048377813439499');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (55, 'Nikos', 'Coalburn', 'ncoalburn1i@topsy.com', '1919-09-12', 'Sweden', '(723) 8528138', '503-73-4499', '5048371279806002');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (56, 'Coriss', 'Mazzilli', 'cmazzilli1j@freewebs.com', '1929-09-29', 'Sweden', '(807) 6776608', '242-34-9241', '5048379576902416');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (57, 'Laetitia', 'Verrell', 'lverrell1k@miibeian.gov.cn', '1975-02-08', 'China', '(713) 5921408', '236-37-3155', '5108751108540665');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (58, 'Sauveur', 'Aldrin', 'saldrin1l@w3.org', '1979-10-11', 'Greece', '(196) 3572065', '598-87-0616', '5108758572040593');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (59, 'Talya', 'MacCarter', 'tmaccarter1m@alexa.com', '1946-02-27', 'Laos', '(644) 8753247', '274-19-4568', '5108754928461146');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (60, 'Jayne', 'Snare', 'jsnare1n@simplemachines.org', '1915-09-05', 'China', '(913) 1821632', '396-07-2127', '5048377565576605');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (61, 'Lexie', 'Tomasek', 'ltomasek1o@altervista.org', '1909-03-19', 'Botswana', '(946) 9626929', '876-93-5061', '5048376555861787');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (62, 'Sherwin', 'Doddridge', 'sdoddridge1p@dailymotion.com', '1900-12-01', 'Jordan', '(596) 7475507', '119-68-4711', '5048376178599566');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (63, 'Madalyn', 'Calderhead', 'mcalderhead1q@alexa.com', '1994-01-09', 'Oman', '(485) 6432284', '215-93-0883', '5108750451973077');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (64, 'Frank', 'Cossons', 'fcossons1r@scientificamerican.com', '1940-10-29', 'Indonesia', '(240) 3046246', '838-54-6622', '5048375419671184');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (65, 'Meredithe', 'Posselow', 'mposselow1s@lulu.com', '1930-07-19', 'Poland', '(414) 3403757', '665-87-5726', '5108757104185520');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (66, 'Lucinda', 'Hairs', 'lhairs1t@rambler.ru', '1922-10-04', 'Poland', '(505) 3089736', '821-34-8064', '5048377400482381');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (67, 'Dolley', 'Darkott', 'ddarkott1u@yahoo.co.jp', '1922-05-04', 'Bosnia and Herzegovina', '(824) 1626870', '281-72-1249', '5048372152265779');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (68, 'Sibbie', 'Sheehy', 'ssheehy1v@imgur.com', '1942-08-02', 'Ukraine', '(336) 9015873', '665-51-7639', '5108757194789686');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (69, 'Bridgette', 'Forrestill', 'bforrestill1w@sbwire.com', '1910-11-11', 'Brazil', '(167) 6679862', '232-49-4088', '5048372515905111');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (70, 'Kathryn', 'Maffioni', 'kmaffioni1x@skyrock.com', '1941-09-06', 'Armenia', '(942) 9375852', '866-85-5805', '5048374226685669');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (71, 'Gilberte', 'Gaspar', 'ggaspar1y@tripod.com', '1902-03-26', 'Oman', '(939) 3761523', '833-84-0161', '5048376578958156');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (72, 'Karena', 'Rowat', 'krowat1z@slashdot.org', '1919-04-26', 'China', '(235) 4071352', '185-81-7028', '5048374215672686');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (73, 'Karolina', 'Schwant', 'kschwant20@home.pl', '2001-05-09', 'Indonesia', '(224) 9981435', '140-05-5442', '5048378210238948');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (74, 'Kenn', 'Scurlock', 'kscurlock21@g.co', '1919-01-05', 'Philippines', '(961) 6243242', '305-55-5685', '5048378076925182');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (75, 'Darby', 'Cawood', 'dcawood22@devhub.com', '1973-03-15', 'Indonesia', '(843) 2623973', '235-09-3686', '5108751235558523');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (76, 'Yurik', 'Idell', 'yidell23@arizona.edu', '1960-10-31', 'China', '(566) 5952822', '308-56-2241', '5048379113147277');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (77, 'Mabel', 'Bernakiewicz', 'mbernakiewicz24@paypal.com', '1905-06-27', 'France', '(159) 8735100', '588-42-2945', '5048372872346214');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (78, 'Hadria', 'Pass', 'hpass25@linkedin.com', '1941-01-25', 'Indonesia', '(269) 8162228', '260-52-2804', '5048376674954224');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (79, 'Charis', 'Tolfrey', 'ctolfrey26@merriam-webster.com', '1948-09-24', 'Canada', '(801) 1061149', '405-77-3942', '5108757018524442');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (80, 'Dulcine', 'Czapla', 'dczapla27@si.edu', '1905-05-04', 'Poland', '(920) 1503346', '895-38-9729', '5048379435404000');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (81, 'Drona', 'Philbin', 'dphilbin28@google.cn', '1905-04-26', 'Netherlands', '(602) 6042481', '636-66-5672', '5048374544485768');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (82, 'Ivett', 'Perel', 'iperel29@cpanel.net', '1920-05-25', 'Philippines', '(145) 5104989', '261-45-1890', '5048377598321284');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (83, 'Sib', 'Cuseck', 'scuseck2a@example.com', '1950-04-07', 'China', '(669) 9401111', '818-83-1814', '5108757790029743');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (84, 'Sena', 'Ansty', 'sansty2b@sitemeter.com', '1943-05-08', 'China', '(485) 8559488', '410-10-8261', '5048370423909985');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (85, 'Lindsay', 'Giovannetti', 'lgiovannetti2c@blogs.com', '1995-04-14', 'Indonesia', '(401) 6735340', '257-07-8829', '5108751932896135');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (86, 'Arly', 'Doylend', 'adoylend2d@timesonline.co.uk', '1940-01-31', 'Kosovo', '(307) 6577884', '802-04-3362', '5048378637241509');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (87, 'Abby', 'Sothern', 'asothern2e@webmd.com', '1908-04-20', 'China', '(268) 6901706', '483-19-4559', '5048374690879947');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (88, 'Barri', 'Ockenden', 'bockenden2f@woothemes.com', '1999-12-18', 'China', '(172) 6852403', '704-10-2554', '5108752262861269');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (89, 'Ferdinand', 'Leeder', 'fleeder2g@arizona.edu', '1930-01-05', 'China', '(429) 6912625', '579-42-4723', '5048373978008518');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (90, 'Maximo', 'Hambright', 'mhambright2h@eventbrite.com', '1970-05-23', 'Indonesia', '(318) 5674860', '245-94-8685', '5108755581330759');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (91, 'Berkie', 'Rapp', 'brapp2i@dion.ne.jp', '1929-01-14', 'Hungary', '(990) 7771183', '178-92-9779', '5108750205411085');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (92, 'Arlee', 'Thirkettle', 'athirkettle2j@spotify.com', '1964-04-30', 'Malaysia', '(666) 4930060', '366-78-5348', '5048378112721223');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (93, 'Janie', 'Kliment', 'jkliment2k@ed.gov', '1964-01-24', 'France', '(101) 6809395', '754-70-8335', '5108758354399662');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (94, 'Juliette', 'Cory', 'jcory2l@jigsy.com', '1980-04-01', 'Syria', '(302) 4214548', '410-58-0851', '5108755190889203');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (95, 'Abey', 'Minors', 'aminors2m@360.cn', '1980-05-06', 'China', '(913) 6583095', '883-95-7513', '5108756177433114');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (96, 'Sherry', 'Thaw', 'sthaw2n@plala.or.jp', '1926-08-21', 'Colombia', '(613) 4735404', '107-96-2298', '5048372929658736');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (97, 'Amabelle', 'Dundon', 'adundon2o@blog.com', '1952-07-25', 'China', '(533) 1085907', '804-35-5546', '5048372693599140');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (98, 'Gwendolin', 'Kupec', 'gkupec2p@constantcontact.com', '1946-01-30', 'Peru', '(772) 1880513', '806-15-4193', '5108754238862538');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (99, 'Rob', 'Panons', 'rpanons2q@skyrock.com', '1942-11-08', 'Indonesia', '(850) 2742664', '714-05-3596', '5048379981534234');
insert into Customer (CustID, First_Name, Last_Name, Email, DOB, Region, Phone, SSN, Credit_Card) values (100, 'Gui', 'Kilgrew', 'gkilgrew2r@linkedin.com', '1901-06-18', 'Portugal', '(433) 5823677', '718-49-8353', '5048379495250244');

-- Authentication

insert into Authentication (CustID, Type, AuthNum) values (1, 'Passport', 'N536pj319Q');
insert into Authentication (CustID, Type, AuthNum) values (2, 'Passport', 'B044kn305Y');
insert into Authentication (CustID, Type, AuthNum) values (3, 'Passport', 'K267wq555Y');
insert into Authentication (CustID, Type, AuthNum) values (4, 'StateID', 'B115te496A');
insert into Authentication (CustID, Type, AuthNum) values (5, 'Passport', 'U306bc826R');
insert into Authentication (CustID, Type, AuthNum) values (6, 'StateID', 'S926ss096K');
insert into Authentication (CustID, Type, AuthNum) values (7, 'StateID', 'I599eg118F');
insert into Authentication (CustID, Type, AuthNum) values (8, 'StateID', 'N554ts502H');
insert into Authentication (CustID, Type, AuthNum) values (9, 'Passport', 'Z493qd321Q');
insert into Authentication (CustID, Type, AuthNum) values (10, 'Passport', 'C401pf743S');
insert into Authentication (CustID, Type, AuthNum) values (11, 'Passport', 'N426dc917W');
insert into Authentication (CustID, Type, AuthNum) values (12, 'Passport', 'T648km624W');
insert into Authentication (CustID, Type, AuthNum) values (13, 'Passport', 'Y065qt355J');
insert into Authentication (CustID, Type, AuthNum) values (14, 'Passport', 'U786ep051X');
insert into Authentication (CustID, Type, AuthNum) values (15, 'Passport', 'A562vb126F');
insert into Authentication (CustID, Type, AuthNum) values (16, 'Passport', 'O424cu290T');
insert into Authentication (CustID, Type, AuthNum) values (17, 'Passport', 'V713du650E');
insert into Authentication (CustID, Type, AuthNum) values (18, 'Passport', 'Q502ab027M');
insert into Authentication (CustID, Type, AuthNum) values (19, 'Passport', 'Z915jr348P');
insert into Authentication (CustID, Type, AuthNum) values (20, 'StateID', 'O426mk857G');
insert into Authentication (CustID, Type, AuthNum) values (21, 'StateID', 'T696tg694W');
insert into Authentication (CustID, Type, AuthNum) values (22, 'StateID', 'P698uh794F');
insert into Authentication (CustID, Type, AuthNum) values (23, 'Passport', 'L505td542I');
insert into Authentication (CustID, Type, AuthNum) values (24, 'Passport', 'U239xu359Y');
insert into Authentication (CustID, Type, AuthNum) values (25, 'Passport', 'T204el387W');
insert into Authentication (CustID, Type, AuthNum) values (26, 'Passport', 'U912qk727J');
insert into Authentication (CustID, Type, AuthNum) values (27, 'Passport', 'I786xv065X');
insert into Authentication (CustID, Type, AuthNum) values (28, 'StateID', 'S551ee264B');
insert into Authentication (CustID, Type, AuthNum) values (29, 'StateID', 'T262qm444E');
insert into Authentication (CustID, Type, AuthNum) values (30, 'Passport', 'E792oh169P');
insert into Authentication (CustID, Type, AuthNum) values (31, 'StateID', 'Y419qz506D');
insert into Authentication (CustID, Type, AuthNum) values (32, 'Passport', 'X683ha541R');
insert into Authentication (CustID, Type, AuthNum) values (33, 'StateID', 'Q780rq772L');
insert into Authentication (CustID, Type, AuthNum) values (34, 'StateID', 'Y064av601X');
insert into Authentication (CustID, Type, AuthNum) values (35, 'StateID', 'J177qf076J');
insert into Authentication (CustID, Type, AuthNum) values (36, 'StateID', 'P174sq146G');
insert into Authentication (CustID, Type, AuthNum) values (37, 'StateID', 'Z489vk692G');
insert into Authentication (CustID, Type, AuthNum) values (38, 'Passport', 'Y283cs135Y');
insert into Authentication (CustID, Type, AuthNum) values (39, 'Passport', 'L387nj504G');
insert into Authentication (CustID, Type, AuthNum) values (40, 'StateID', 'O199md574J');
insert into Authentication (CustID, Type, AuthNum) values (41, 'Passport', 'X636vv395J');
insert into Authentication (CustID, Type, AuthNum) values (42, 'Passport', 'H374yv004D');
insert into Authentication (CustID, Type, AuthNum) values (43, 'StateID', 'P771pw031T');
insert into Authentication (CustID, Type, AuthNum) values (44, 'StateID', 'P159ci513E');
insert into Authentication (CustID, Type, AuthNum) values (45, 'Passport', 'B429kp383U');
insert into Authentication (CustID, Type, AuthNum) values (46, 'Passport', 'L143di807W');
insert into Authentication (CustID, Type, AuthNum) values (47, 'Passport', 'Y323qd945U');
insert into Authentication (CustID, Type, AuthNum) values (48, 'Passport', 'K394ei329T');
insert into Authentication (CustID, Type, AuthNum) values (49, 'Passport', 'Y477uq122W');
insert into Authentication (CustID, Type, AuthNum) values (50, 'Passport', 'S081pe406Q');
insert into Authentication (CustID, Type, AuthNum) values (51, 'Passport', 'M913rf534G');
insert into Authentication (CustID, Type, AuthNum) values (52, 'StateID', 'H929lt632E');
insert into Authentication (CustID, Type, AuthNum) values (53, 'StateID', 'M531cl805E');
insert into Authentication (CustID, Type, AuthNum) values (54, 'Passport', 'H935vp560P');
insert into Authentication (CustID, Type, AuthNum) values (55, 'StateID', 'G225ir208H');
insert into Authentication (CustID, Type, AuthNum) values (56, 'Passport', 'C280ph883F');
insert into Authentication (CustID, Type, AuthNum) values (57, 'Passport', 'X384gz256D');
insert into Authentication (CustID, Type, AuthNum) values (58, 'Passport', 'M697vg921B');
insert into Authentication (CustID, Type, AuthNum) values (59, 'Passport', 'O195jw939H');
insert into Authentication (CustID, Type, AuthNum) values (60, 'StateID', 'U084wx417A');
insert into Authentication (CustID, Type, AuthNum) values (61, 'StateID', 'R116dp280T');
insert into Authentication (CustID, Type, AuthNum) values (62, 'Passport', 'F562vo766L');
insert into Authentication (CustID, Type, AuthNum) values (63, 'StateID', 'G733ch164M');
insert into Authentication (CustID, Type, AuthNum) values (64, 'Passport', 'H618pm711F');
insert into Authentication (CustID, Type, AuthNum) values (65, 'Passport', 'G155gn915F');
insert into Authentication (CustID, Type, AuthNum) values (66, 'Passport', 'S780ky612J');
insert into Authentication (CustID, Type, AuthNum) values (67, 'StateID', 'R145wj953A');
insert into Authentication (CustID, Type, AuthNum) values (68, 'StateID', 'L209qx350D');
insert into Authentication (CustID, Type, AuthNum) values (69, 'StateID', 'K847id176J');
insert into Authentication (CustID, Type, AuthNum) values (70, 'StateID', 'O844ut826G');
insert into Authentication (CustID, Type, AuthNum) values (71, 'Passport', 'P243qj453U');
insert into Authentication (CustID, Type, AuthNum) values (72, 'Passport', 'Q122yj040K');
insert into Authentication (CustID, Type, AuthNum) values (73, 'Passport', 'E148yl336J');
insert into Authentication (CustID, Type, AuthNum) values (74, 'StateID', 'I064pt313X');
insert into Authentication (CustID, Type, AuthNum) values (75, 'Passport', 'C883ne502O');
insert into Authentication (CustID, Type, AuthNum) values (76, 'StateID', 'P375hn266C');
insert into Authentication (CustID, Type, AuthNum) values (77, 'StateID', 'I202qa748F');
insert into Authentication (CustID, Type, AuthNum) values (78, 'StateID', 'S231ie974K');
insert into Authentication (CustID, Type, AuthNum) values (79, 'Passport', 'D727cq945Y');
insert into Authentication (CustID, Type, AuthNum) values (80, 'StateID', 'W398io065H');
insert into Authentication (CustID, Type, AuthNum) values (81, 'StateID', 'N945kl486C');
insert into Authentication (CustID, Type, AuthNum) values (82, 'Passport', 'P056uv455W');
insert into Authentication (CustID, Type, AuthNum) values (83, 'StateID', 'I326af117W');
insert into Authentication (CustID, Type, AuthNum) values (84, 'Passport', 'C929kr157N');
insert into Authentication (CustID, Type, AuthNum) values (85, 'Passport', 'K476iq836C');
insert into Authentication (CustID, Type, AuthNum) values (86, 'Passport', 'Y720tx878V');
insert into Authentication (CustID, Type, AuthNum) values (87, 'Passport', 'M228lw589E');
insert into Authentication (CustID, Type, AuthNum) values (88, 'StateID', 'B047lh015Y');
insert into Authentication (CustID, Type, AuthNum) values (89, 'Passport', 'E070cu243J');
insert into Authentication (CustID, Type, AuthNum) values (90, 'Passport', 'E572fh367D');
insert into Authentication (CustID, Type, AuthNum) values (91, 'StateID', 'A636hf517V');
insert into Authentication (CustID, Type, AuthNum) values (92, 'Passport', 'T878bj951Q');
insert into Authentication (CustID, Type, AuthNum) values (93, 'StateID', 'B693gu579F');
insert into Authentication (CustID, Type, AuthNum) values (94, 'Passport', 'M626ty794B');
insert into Authentication (CustID, Type, AuthNum) values (95, 'Passport', 'Q345xk273P');
insert into Authentication (CustID, Type, AuthNum) values (96, 'StateID', 'Q945bj677Y');
insert into Authentication (CustID, Type, AuthNum) values (97, 'StateID', 'L647ei338M');
insert into Authentication (CustID, Type, AuthNum) values (98, 'StateID', 'K196oo539N');
insert into Authentication (CustID, Type, AuthNum) values (99, 'Passport', 'P076rg136X');
insert into Authentication (CustID, Type, AuthNum) values (100, 'Passport', 'N472cn866T');

-- CFD
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (1, 463, '$835956.32', '$1293.64');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (2, 484, '$595079.94', '$2048.18');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (3, 649, '$501382.81', '$7149.59');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (4, 735, '$431180.26', '$2610.34');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (5, 324, '$784853.28', '$273.69');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (6, 601, '$981493.43', '$4264.32');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (7, 482, '$572756.87', '$5946.94');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (8, 430, '$617782.24', '$2002.17');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (9, 555, '$140026.16', '$932.33');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (10, 688, '$842475.44', '$9007.07');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (11, 554, '$603536.48', '$3874.24');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (12, 547, '$817785.83', '$9478.83');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (13, 328, '$553654.04', '$5487.65');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (14, 547, '$655255.95', '$5274.36');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (15, 447, '$120630.95', '$3073.70');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (16, 698, '$612123.76', '$332.01');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (17, 783, '$552278.02', '$8708.84');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (18, 521, '$16054.13', '$2509.47');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (19, 761, '$511927.57', '$5615.61');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (20, 667, '$298791.91', '$1197.28');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (21, 605, '$856145.10', '$9451.13');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (22, 675, '$87615.96', '$7426.85');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (23, 363, '$622444.22', '$2381.13');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (24, 831, '$950962.31', '$3191.63');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (25, 514, '$108553.09', '$5404.66');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (26, 498, '$664714.36', '$5276.86');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (27, 520, '$354016.58', '$137.35');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (28, 630, '$271990.11', '$8904.11');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (29, 682, '$255133.70', '$3956.00');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (30, 501, '$140689.68', '$4510.67');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (31, 441, '$957689.66', '$5932.02');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (32, 319, '$222618.79', '$6900.07');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (33, 334, '$261975.95', '$4908.28');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (34, 640, '$55210.71', '$9275.70');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (35, 375, '$716172.38', '$6785.49');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (36, 468, '$588440.61', '$2856.94');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (37, 550, '$536092.01', '$9791.87');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (38, 369, '$395306.89', '$101.00');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (39, 650, '$88529.13', '$4335.25');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (40, 346, '$520192.51', '$3245.93');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (41, 817, '$21252.89', '$6609.55');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (42, 439, '$710079.80', '$3134.43');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (43, 659, '$862934.52', '$3097.89');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (44, 542, '$747564.55', '$8759.70');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (45, 702, '$225055.80', '$211.67');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (46, 659, '$605351.94', '$5727.52');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (47, 373, '$438320.32', '$7330.97');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (48, 567, '$735424.69', '$5512.21');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (49, 442, '$312327.64', '$7774.58');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (50, 706, '$558671.35', '$6478.44');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (51, 380, '$282010.45', '$8435.69');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (52, 558, '$59235.59', '$5978.77');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (53, 809, '$129178.54', '$4558.17');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (54, 793, '$647093.38', '$7645.38');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (55, 504, '$358434.81', '$5792.04');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (56, 446, '$526672.01', '$296.82');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (57, 392, '$142428.84', '$1539.82');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (58, 673, '$16138.13', '$282.43');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (59, 825, '$801277.72', '$652.88');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (60, 345, '$831970.00', '$8371.11');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (61, 794, '$88709.57', '$2481.34');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (62, 497, '$463799.78', '$8424.69');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (63, 422, '$250657.06', '$3865.74');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (64, 478, '$704496.39', '$5702.87');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (65, 703, '$263149.15', '$9313.95');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (66, 582, '$437898.76', '$9707.44');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (67, 769, '$754170.55', '$4386.47');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (68, 664, '$511497.76', '$8854.00');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (69, 426, '$948072.10', '$5802.48');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (70, 775, '$260771.75', '$6256.94');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (71, 552, '$312290.08', '$126.22');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (72, 334, '$650032.98', '$2577.17');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (73, 498, '$554083.88', '$5358.32');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (74, 677, '$462786.29', '$6128.30');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (75, 767, '$343730.81', '$7569.65');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (76, 699, '$985789.20', '$1608.71');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (77, 367, '$775812.90', '$576.52');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (78, 824, '$874517.65', '$8628.11');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (79, 345, '$393476.06', '$6103.51');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (80, 696, '$238409.46', '$8391.12');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (81, 416, '$832415.21', '$7044.97');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (82, 489, '$312327.46', '$237.46');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (83, 792, '$730964.31', '$8563.58');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (84, 608, '$469966.62', '$281.64');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (85, 618, '$24363.36', '$43.10');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (86, 434, '$150337.17', '$3036.31');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (87, 837, '$287216.46', '$3247.69');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (88, 808, '$862432.96', '$2105.32');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (89, 588, '$767087.16', '$6153.10');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (90, 811, '$916879.04', '$6863.04');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (91, 408, '$579555.13', '$7484.28');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (92, 429, '$947629.88', '$6823.41');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (93, 777, '$310312.97', '$441.80');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (94, 702, '$111535.85', '$3923.65');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (95, 415, '$346098.22', '$9422.45');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (96, 353, '$542695.32', '$6114.18');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (97, 584, '$191183.95', '$8820.33');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (98, 728, '$219283.48', '$8997.36');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (99, 677, '$290563.25', '$5631.35');
insert into Customer_Finance_Details (CustID, CreditScore, Income, AmountTraded) values (100, 428, '$548527.63', '$6347.72');

-- CompanyInvoice

insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (1, 21, 1, 12, 3.09, 769, '2021-12-27', '14:45');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (2, 32, 14, 49, 1.46, 213, '2022-11-06', '9:41');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (3, 8, 40, 14, 4.61, 599, '2022-10-27', '9:51');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (4, 41, 5, 12, 1.39, 975, '2022-02-20', '9:51');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (5, 27, 37, 1, 1.92, 835, '2022-08-22', '11:46');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (6, 39, 15, 20, 3.68, 89, '2022-03-27', '11:16');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (7, 14, 13, 8, 3.16, 121, '2022-09-22', '9:45');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (8, 15, 24, 31, 3.23, 997, '2022-06-28', '15:01');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (9, 23, 35, 25, 4.43, 986, '2022-01-17', '13:49');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (10, 36, 36, 16, 4.96, 330, '2022-02-27', '11:00');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (11, 8, 47, 30, 3.38, 681, '2022-01-13', '9:10');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (12, 40, 3, 37, 3.34, 621, '2022-02-01', '12:28');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (13, 27, 16, 20, 1.48, 982, '2022-10-27', '14:51');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (14, 14, 22, 37, 3.07, 845, '2022-06-28', '13:20');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (15, 25, 36, 8, 3.96, 647, '2022-10-23', '14:59');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (16, 35, 33, 32, 2.15, 733, '2021-12-17', '9:48');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (17, 18, 17, 35, 1.71, 508, '2022-01-04', '11:56');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (18, 3, 5, 11, 3.2, 470, '2021-12-15', '15:45');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (19, 33, 2, 41, 1.64, 881, '2022-08-30', '9:48');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (20, 28, 13, 43, 2.66, 605, '2022-01-18', '10:37');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (21, 31, 40, 35, 2.58, 199, '2022-05-29', '15:11');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (22, 4, 28, 19, 3.71, 314, '2022-03-24', '15:29');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (23, 10, 31, 50, 2.77, 805, '2022-07-17', '12:08');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (24, 39, 43, 34, 1.39, 642, '2022-09-10', '13:58');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (25, 4, 25, 3, 2.5, 109, '2022-01-24', '13:39');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (26, 4, 37, 30, 1.66, 257, '2022-05-30', '12:16');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (27, 21, 49, 26, 4.8, 493, '2022-07-13', '13:06');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (28, 19, 47, 42, 2.79, 730, '2022-07-12', '10:40');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (29, 41, 9, 31, 2.93, 887, '2022-05-24', '13:41');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (30, 38, 15, 6, 4.43, 708, '2021-12-19', '11:27');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (31, 12, 5, 5, 2.25, 588, '2022-06-16', '15:13');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (32, 39, 15, 30, 4.51, 793, '2022-06-07', '16:48');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (33, 26, 46, 10, 2.42, 561, '2022-07-06', '9:28');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (34, 23, 2, 48, 4.16, 964, '2021-12-04', '11:10');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (35, 13, 39, 23, 2.76, 40, '2022-04-06', '11:34');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (36, 33, 13, 44, 3.59, 684, '2022-07-07', '10:25');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (37, 11, 50, 37, 3.34, 372, '2022-05-03', '16:41');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (38, 43, 49, 8, 3.86, 180, '2022-06-18', '16:48');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (39, 1, 28, 9, 1.5, 867, '2022-08-18', '10:05');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (40, 45, 48, 9, 4.56, 95, '2022-05-21', '9:12');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (41, 15, 48, 50, 1.69, 609, '2022-07-12', '12:40');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (42, 42, 35, 29, 1.38, 214, '2021-12-16', '11:03');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (43, 48, 30, 11, 1.34, 304, '2022-02-07', '15:30');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (44, 24, 11, 34, 2.29, 666, '2022-09-21', '11:01');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (45, 27, 11, 45, 4.1, 202, '2022-03-03', '15:19');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (46, 40, 6, 24, 3.24, 767, '2022-02-15', '13:32');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (47, 2, 16, 21, 2.47, 337, '2022-06-16', '16:41');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (48, 1, 1, 36, 4.56, 761, '2022-02-17', '9:14');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (49, 13, 10, 16, 1.25, 953, '2022-04-03', '10:22');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (50, 1, 4, 11, 4.39, 130, '2022-10-23', '9:12');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (51, 12, 23, 23, 1.14, 912, '2022-04-22', '9:42');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (52, 14, 3, 34, 4.46, 665, '2021-12-15', '15:05');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (53, 21, 27, 26, 2.51, 940, '2022-05-16', '10:56');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (54, 33, 27, 24, 4.57, 676, '2022-02-28', '10:03');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (55, 50, 49, 36, 3.6, 222, '2022-01-04', '9:37');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (56, 36, 34, 34, 4.72, 776, '2021-11-29', '14:49');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (57, 6, 12, 18, 3.85, 89, '2022-10-13', '11:44');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (58, 41, 42, 34, 3.17, 109, '2022-09-11', '9:04');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (59, 44, 40, 35, 2.9, 293, '2022-02-08', '10:39');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (60, 33, 6, 1, 3.32, 584, '2022-01-05', '9:04');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (61, 10, 26, 25, 2.78, 106, '2022-10-28', '16:14');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (62, 4, 3, 5, 4.0, 107, '2022-01-24', '9:58');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (63, 34, 35, 42, 1.62, 633, '2022-03-14', '13:10');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (64, 12, 13, 11, 4.77, 384, '2022-10-08', '9:37');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (65, 22, 39, 41, 1.82, 389, '2022-04-01', '13:18');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (66, 36, 41, 32, 1.14, 230, '2022-04-16', '14:50');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (67, 47, 32, 15, 4.28, 10, '2022-02-16', '14:28');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (68, 39, 19, 1, 4.68, 269, '2022-06-25', '11:43');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (69, 31, 46, 41, 3.66, 876, '2022-07-22', '9:59');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (70, 44, 40, 12, 3.34, 842, '2022-05-03', '9:59');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (71, 25, 35, 43, 3.84, 861, '2022-10-14', '16:52');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (72, 45, 38, 9, 3.46, 946, '2022-05-07', '11:37');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (73, 10, 2, 21, 3.97, 549, '2022-01-31', '9:24');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (74, 22, 21, 20, 3.34, 746, '2022-08-10', '15:13');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (75, 15, 32, 3, 2.72, 200, '2022-10-05', '13:59');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (76, 42, 11, 5, 1.25, 760, '2022-09-30', '16:33');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (77, 20, 14, 22, 1.55, 298, '2022-05-06', '16:23');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (78, 23, 14, 43, 4.88, 735, '2022-03-18', '16:06');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (79, 36, 45, 49, 1.99, 114, '2022-11-05', '14:29');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (80, 29, 25, 8, 3.49, 494, '2022-05-22', '14:20');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (81, 7, 49, 23, 1.27, 466, '2022-01-24', '12:07');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (82, 25, 5, 5, 2.34, 736, '2022-02-05', '12:52');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (83, 22, 25, 31, 1.4, 913, '2022-06-20', '14:30');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (84, 3, 37, 30, 3.68, 373, '2022-09-27', '9:55');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (85, 43, 20, 2, 4.4, 470, '2022-11-11', '15:33');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (86, 21, 25, 38, 1.85, 27, '2022-09-27', '16:03');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (87, 26, 30, 30, 3.84, 811, '2022-01-31', '11:20');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (88, 12, 33, 45, 3.6, 769, '2022-08-08', '9:38');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (89, 38, 9, 16, 1.83, 750, '2022-03-04', '10:05');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (90, 9, 2, 31, 2.21, 225, '2022-03-03', '15:23');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (91, 36, 19, 1, 2.79, 649, '2022-05-21', '15:24');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (92, 49, 44, 38, 3.06, 221, '2022-04-22', '14:46');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (93, 19, 44, 7, 2.74, 679, '2021-12-17', '11:52');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (94, 15, 13, 42, 1.37, 296, '2022-04-06', '10:26');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (95, 25, 15, 7, 3.73, 909, '2022-07-26', '16:44');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (96, 1, 44, 12, 2.14, 202, '2022-10-06', '14:13');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (97, 38, 22, 33, 3.11, 546, '2022-04-19', '9:40');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (98, 20, 20, 19, 3.9, 441, '2022-08-08', '15:52');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (99, 22, 42, 22, 3.75, 437, '2022-06-26', '16:59');
insert into Company_Invoice (CompInvoiceID, AdminID, StockID, CompanyID, Commission, Quantity, Date, Time) values (100, 26, 28, 4, 2.89, 139, '2022-03-07', '12:50');

-- Customer Transaction

insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (1, null, 24, 11, 'bought', '2022-07-09', '13:09', 97, 23, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (2, 17, 8, 11, 'sold', '2022-07-22', '20:29', 68, 78, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (3, null, 87, 48, 'sold', '2022-05-29', '22:02', 39, 12, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (4, null, 91, 19, 'sold', '2021-12-04', '3:11', 78, 69, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (5, null, 68, 4, 'sold', '2022-02-16', '19:41', 44, 100, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (6, 3, 15, 4, 'sold', '2022-06-26', '0:41', 64, 60, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (7, 47, 6, 43, 'sold', '2022-04-04', '19:41', 100, 66, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (8, 36, 1, 35, 'bought', '2022-01-16', '18:43', 25, 28, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (9, 38, 46, 16, 'bought', '2022-03-05', '1:40', 48, 82, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (10, 39, 57, 33, 'bought', '2022-11-12', '21:56', 59, 88, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (11, 46, 83, 10, 'bought', '2022-04-11', '17:31', 17, 38, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (12, 37, 22, 14, 'sold', '2022-08-27', '14:16', 18, 22, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (13, 45, 60, 28, 'sold', '2022-08-21', '12:32', 91, 6, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (14, 29, 25, 29, 'sold', '2022-11-21', '6:15', 5, 98, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (15, 9, 68, 8, 'bought', '2022-10-29', '10:01', 61, 70, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (16, null, 73, 6, 'bought', '2022-01-21', '12:17', 18, 28, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (17, 40, 80, 43, 'sold', '2022-05-28', '11:10', 3, 32, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (18, 38, 92, 27, 'bought', '2022-05-01', '15:44', 82, 66, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (19, 8, 50, 48, 'bought', '2022-11-05', '4:52', 100, 92, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (20, 47, 70, 42, 'bought', '2022-05-07', '14:24', 5, 25, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (21, null, 79, 27, 'bought', '2021-12-02', '21:50', 6, 38, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (22, 7, 35, 13, 'sold', '2021-12-22', '4:13', 91, 20, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (23, 10, 67, 23, 'sold', '2022-04-05', '7:39', 23, 48, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (24, null, 60, 12, 'sold', '2022-05-18', '7:06', 31, 59, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (25, null, 1, 35, 'sold', '2022-06-14', '17:25', 85, 99, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (26, null, 44, 44, 'bought', '2021-12-06', '14:05', 16, 58, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (27, 4, 78, 23, 'bought', '2022-06-04', '0:07', 68, 36, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (28, 19, 73, 34, 'bought', '2022-01-18', '18:32', 35, 69, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (29, null, 44, 17, 'sold', '2022-09-02', '12:26', 21, 33, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (30, null, 23, 16, 'bought', '2022-08-11', '19:14', 2, 91, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (31, 33, 35, 24, 'bought', '2022-05-23', '23:32', 71, 32, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (32, 27, 12, 46, 'sold', '2022-03-22', '9:48', 83, 8, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (33, null, 76, 42, 'sold', '2021-12-02', '5:32', 40, 77, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (34, 49, 33, 5, 'sold', '2022-08-13', '18:21', 5, 27, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (35, null, 67, 25, 'bought', '2022-08-28', '16:06', 95, 88, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (36, 37, 2, 27, 'sold', '2022-01-08', '22:13', 99, 9, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (37, 19, 74, 44, 'sold', '2022-08-14', '18:32', 32, 73, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (38, 24, 18, 18, 'bought', '2022-07-27', '22:15', 71, 33, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (39, 47, 54, 18, 'bought', '2022-09-08', '21:53', 61, 67, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (40, 19, 48, 1, 'sold', '2022-01-12', '18:54', 9, 34, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (41, null, 93, 1, 'sold', '2022-05-18', '19:48', 7, 60, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (42, 34, 6, 21, 'sold', '2022-02-06', '13:48', 32, 55, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (43, 30, 67, 17, 'sold', '2022-04-14', '5:21', 84, 7, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (44, 47, 54, 26, 'sold', '2022-07-30', '19:44', 29, 58, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (45, 30, 97, 15, 'bought', '2022-05-26', '14:17', 21, 5, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (46, 33, 93, 30, 'bought', '2022-11-11', '1:51', 100, 27, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (47, 33, 6, 26, 'bought', '2022-03-31', '14:31', 18, 5, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (48, null, 26, 4, 'sold', '2022-08-30', '13:58', 99, 94, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (49, null, 18, 27, 'bought', '2022-01-08', '11:46', 22, 27, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (50, 40, 23, 50, 'bought', '2022-01-26', '14:18', 8, 90, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (51, 16, 75, 40, 'sold', '2021-11-26', '14:59', 53, 1, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (52, 7, 6, 32, 'bought', '2022-01-26', '19:06', 38, 56, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (53, 21, 78, 15, 'bought', '2022-10-03', '13:35', 63, 41, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (54, 36, 100, 4, 'bought', '2022-02-20', '2:52', 12, 17, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (55, null, 2, 46, 'bought', '2022-09-15', '0:28', 61, 45, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (56, 37, 84, 26, 'bought', '2022-04-25', '6:45', 99, 50, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (57, 18, 8, 17, 'sold', '2022-04-29', '2:02', 81, 79, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (58, 21, 13, 6, 'bought', '2022-01-25', '14:34', 50, 99, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (59, 34, 39, 26, 'sold', '2022-06-10', '19:45', 19, 59, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (60, 8, 95, 47, 'bought', '2021-11-27', '22:52', 95, 19, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (61, 33, 47, 16, 'bought', '2022-06-26', '20:37', 94, 61, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (62, null, 18, 40, 'sold', '2022-02-23', '22:26', 29, 16, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (63, 7, 85, 16, 'sold', '2022-11-01', '12:30', 30, 48, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (64, 10, 54, 49, 'sold', '2022-06-16', '5:13', 84, 31, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (65, 50, 25, 4, 'sold', '2022-10-30', '16:42', 20, 45, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (66, 1, 96, 24, 'bought', '2022-03-27', '0:59', 81, 16, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (67, 19, 10, 9, 'sold', '2022-02-10', '8:04', 42, 20, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (68, 6, 69, 15, 'bought', '2022-08-02', '2:53', 58, 76, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (69, null, 92, 29, 'bought', '2022-09-05', '10:48', 8, 91, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (70, null, 93, 41, 'sold', '2021-12-28', '14:45', 77, 20, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (71, 47, 38, 4, 'bought', '2022-02-27', '15:58', 77, 1, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (72, 25, 45, 34, 'sold', '2022-08-03', '12:44', 49, 44, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (73, null, 62, 2, 'sold', '2022-02-02', '22:30', 2, 17, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (74, null, 97, 45, 'sold', '2022-09-20', '23:16', 1, 4, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (75, null, 10, 50, 'sold', '2022-04-16', '10:35', 48, 49, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (76, null, 90, 43, 'bought', '2022-03-27', '14:57', 86, 67, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (77, 38, 11, 33, 'bought', '2022-06-18', '19:30', 81, 51, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (78, 5, 59, 24, 'sold', '2021-12-10', '23:52', 70, 95, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (79, 26, 6, 33, 'sold', '2022-03-15', '0:22', 44, 40, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (80, 35, 70, 50, 'bought', '2022-09-02', '17:37', 59, 24, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (81, 21, 84, 27, 'sold', '2022-01-28', '7:44', 52, 83, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (82, 46, 98, 18, 'bought', '2022-08-11', '5:06', 89, 32, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (83, null, 100, 1, 'sold', '2022-02-14', '15:14', 41, 95, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (84, 31, 99, 37, 'bought', '2022-01-04', '2:10', 69, 30, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (85, null, 41, 47, 'bought', '2022-04-22', '0:02', 59, 17, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (86, 44, 84, 14, 'bought', '2022-01-31', '10:28', 54, 42, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (87, 36, 19, 50, 'sold', '2022-09-14', '8:45', 35, 53, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (88, 33, 77, 28, 'sold', '2022-01-24', '20:43', 78, 40, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (89, null, 49, 2, 'sold', '2021-12-21', '13:38', 88, 30, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (90, null, 26, 39, 'bought', '2022-08-17', '20:33', 49, 51, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (91, null, 6, 38, 'sold', '2022-06-10', '7:17', 60, 34, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (92, 1, 14, 18, 'bought', '2022-08-05', '12:48', 75, 60, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (93, 28, 89, 14, 'bought', '2022-05-12', '12:40', 63, 99, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (94, 46, 42, 17, 'sold', '2022-08-26', '7:57', 8, 89, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (95, 3, 70, 45, 'bought', '2022-08-31', '22:46', 67, 81, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (96, 45, 40, 40, 'sold', '2021-11-30', '11:31', 1, 8, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (97, 15, 55, 35, 'sold', '2022-06-13', '4:22', 2, 15, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (98, 39, 13, 35, 'sold', '2022-02-11', '22:22', 97, 62, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (99, null, 28, 26, 'bought', '2022-11-09', '11:47', 48, 86, null);
insert into Customer_Transactions (TransactionID, SupportRepID, CustomerID, StockID, Type, Date, Time, Stock_Quantity, Price_Traded_At, TotalPrice) values (100, null, 61, 23, 'sold', '2022-04-08', '16:45', 58, 56, null);
