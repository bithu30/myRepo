create table trucks(driverid varchar, truckid varchar, model varchar)
COPY trucks FROM 'trucks.csv' DELIMITER ',' CSV HEADER;
