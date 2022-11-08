CREATE TABLE `bus_driver` (
  `driver_id` int(5) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `contact_no` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `bus_driver` (`driver_id`, `name`, `contact_no`) VALUES
(1, 'Ram Khadka', 9876546541),
(2, 'Sworup Jha', 9877654321),
(3, 'Manish Shrestha', 9876546563),
(4, 'Harish Bhattrai', 9876546754),
(5, 'Sagar Karki', 9877663344),
(6, 'Jenis Dahal', 9841564738),
(7, 'Rohit Rauniyar', 9851140001),
(8, 'Ming Sherpa', 9811223344),
(9, 'Anup Bam', 9876354662),
(10, 'Samir Khadka', 9876546633),
(11, 'Ashish Gurung', 9876546644),
(12, 'Sudip Neupane', 9818367942),
(13, 'Sanskar Pradhan', 9869416158),
(14, 'Bipin Poudel', 9818267565),
(15, 'Baibhav Sharma', 9818625576),
(16, 'Ashok Puri', 9818265767),
(17, 'Sashikanth Jha', 9879879874),
(18, 'Ansal Tamang', 9841587879),
(20, 'driver 10', 9874563214);


CREATE TABLE `bus_info` (
  `bus_name` varchar(20) DEFAULT NULL,
  `bus_number` varchar(20) NOT NULL,
  `bus_type` enum('AC','Non AC','Deluxe') DEFAULT NULL,
  `no_of_seats` int(2) NOT NULL DEFAULT 40
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `bus_info` (`bus_name`, `bus_number`, `bus_type`, `no_of_seats`) VALUES
('Makalu bus', '1', 'AC', 40),
('Makalu bus', '10', 'AC', 40),
('BlueSky Bus', '2', 'AC', 40),
('Makalu bus', '3', 'Non AC', 40),
('BlueSky Bus', '4', 'Non AC', 40),
('Makalu Bus', '5', 'Deluxe', 40),
('BlueSky Bus', '6', 'Deluxe', 40),
('Sunrise Bus', '7', 'AC', 40),
('Sunrise Bus', '8', 'Non AC', 40),
('Sunrise Bus', '9', 'Deluxe', 40);

CREATE TABLE `bus_schedule` (
  `schedule_id` int(11) NOT NULL,
  `bus_id` varchar(20) NOT NULL,
  `departs_at` time DEFAULT NULL,
  `arrives_at` time DEFAULT NULL,
  `driver_id` int(5) DEFAULT NULL,
  `depart_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `bus_schedule` (`schedule_id`, `bus_id`, `departs_at`, `arrives_at`, `driver_id`, `depart_date`) VALUES
(1, '6', '07:15:00', '03:00:00', 2, '2021-08-18'),
(2, '1', '08:30:00', '15:00:00', 18, '2021-08-20'),
(3, '4', '07:15:00', '03:00:00', 9, '2021-08-18'),
(13, '2', '08:30:00', '18:00:00', 3, '2021-08-23'),
(17, '3', '20:00:00', '04:00:00', 4, '2021-08-22'),
(18, '5', '22:00:00', '05:00:00', 10, '2021-08-21'),
(19, '8', '06:00:00', '12:00:00', 12, '2021-08-18');

DELIMITER $$
CREATE TRIGGER `copy_busschedule` BEFORE UPDATE ON `bus_schedule` FOR EACH ROW begin
insert into bus_schedule_backup(driver_id,bus_id,departs_at,arrives_at) values (old.driver_id,old.bus_id,old.departs_at, old.arrives_at);
end
$$
DELIMITER ;

CREATE TABLE `bus_schedule_backup` (
  `driver_id` int(5) DEFAULT NULL,
  `bus_id` varchar(20) DEFAULT NULL,
  `departs_at` time DEFAULT NULL,
  `arrives_at` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `count_ticket_occupancy` (
`bus_id` varchar(20)
,`bus_name` varchar(20)
,`from_city` enum('Kathmandu','Chitwan','Jhapa','Pokhara')
,`to_city` enum('Kathmandu','Chitwan','Jhapa','Pokhara')
,`No of tickets` bigint(21)
,`no_of_seats` int(2)
,`date_of_journey` date
);

CREATE TABLE `driver_of_bus` (
`driver_id` int(5)
,`name` varchar(30)
,`contact_no` bigint(10)
,`bus_name` varchar(20)
,`bus_number` varchar(20)
,`bus_type` enum('AC','Non AC','Deluxe')
,`no_of_seats` int(2)
);

CREATE TABLE `passenger` (
  `p_id` int(6) NOT NULL,
  `p_name` varchar(30) DEFAULT NULL,
  `gender` enum('Male','Female','Others') DEFAULT NULL,
  `contact_no` varchar(10) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;--

INSERT INTO `passenger` (`p_id`, `p_name`, `gender`, `contact_no`, `address`) VALUES
(1, 'Sushil Rai', 'Male', '987654654', 'baneshwor'),
(2, 'Riwaj Neupane', 'Male', '9899898897', 'Koteshwor'),
(3, 'Samit Baral', 'Male', '987212354', 'Bagbazar'),
(4, 'Babu Chiri Sherpa', 'Female', '987474147', 'Lokanthali'),
(5, 'Ang Rita', 'Female', '9879879877', 'abcxyz'),
(6, 'Apa Sherpa', 'Others', '9876546542', 'Chabel'),
(7, 'Basanta Regmi', 'Male', '9879876545', 'Naikap'),
(8, 'Paras Khadka', 'Male', '9877897897', 'Kalimati'),
(9, 'Dayaram Dahal', 'Female', '9877878787', 'Teku'),
(10, 'Atul Gautam', 'Female', '987879877', 'Tripureshwor'),
(11, 'Harsha Bahadur ', 'Male', '987654321', 'kathmandu'),
(12, 'Riwaj Neupane', 'Male', '9869416157', 'Chabhail'),
(13, 'Samit Baral', 'Male', '123456789', 'Bagbazar'),
(14, 'Ram Sharma', 'Male', '9818367943', 'Lokanthali'),
(15, 'Hai Kandel', 'Male', '9841411648', 'Thapathali'),
(16, 'Sita Magar', 'Female', '981234567', 'Jhapa'),
(17, 'Laxmi Aryal', 'Female', '9870665544', 'Kaski'),
(18, 'Maya Lama ', 'Female', '9811223344', 'Banepa'),
(19, 'Manoj Khadka', 'Male', '9855667711', 'Lamjung'),
(20, 'Raju Ray', 'Male', '9871234778', 'Biratnagar');

CREATE TABLE `reserved_seats` (
  `bus_id` varchar(20) DEFAULT NULL,
  `seat_number` int(2) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `date_of_journey` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `reserved_seats` (`bus_id`, `seat_number`, `person_id`, `date_of_journey`) VALUES
('2', 5, 1, '2021-08-15'),
('2', 7, 2, '2021-08-16'),
('2', 9, 3, '2021-08-17'),
('2', 11, 4, '2021-08-15'),
('2', 13, 5, '2021-08-16'),
('6', 15, 6, '2021-08-17'),
('2', 17, 5, '2021-08-15'),
('2', 19, 4, '2021-08-15'),
('2', 21, 7, '2021-08-15'),
('4', 23, 8, '2021-08-15'),
('2', 25, 5, '2021-08-16'),
('4', 27, 9, '2021-08-15'),
('7', 29, 5, '2021-08-17');

CREATE TABLE `route` (
  `Route_id` int(20) NOT NULL,
  `from_city` varchar(20) DEFAULT NULL,
  `destination` varchar(20) DEFAULT NULL,
  `bus_id` varchar(20) DEFAULT NULL,
  `bus_type` varchar(10) DEFAULT NULL,
  `fare` int(5) DEFAULT NULL,
  `depart_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `route` (`Route_id`, `from_city`, `destination`, `bus_id`, `bus_type`, `fare`, `depart_date`) VALUES
(1, 'Kathmandu', 'Chitwan', '2', 'AC', 825, '2021-08-15'),
(1, 'Kathmandu', 'Chitwan', '2', 'AC', 825, '2021-08-16'),
(1, 'Chitwan', 'Kathmandu', '2', 'AC', 825, '2021-08-17'),
(2, 'Kathmandu', 'Pokhara', '2', 'AC', 550, '2021-08-15'),
(2, 'Pokhara', 'Kathmandu', '2', 'AC', 550, '2021-08-16'),
(3, 'Kathmandu', 'Jhapa', '6', 'Deluxe', 1200, '2021-08-17'),
(3, 'Jhapa', 'Kathmandu', '2', 'AC ', 1100, '2021-08-15'),
(2, 'Kathmandu', 'Pokhara', '2', 'AC', 550, '2021-08-15'),
(2, 'Kathmandu', 'Pokhara', '2', 'AC', 550, '2021-08-15'),
(2, 'Kathmandu', 'Pokhara', '4', 'Non AC', 500, '2021-08-15'),
(2, 'Kathmandu', 'Pokhara', '2', 'AC', 550, '2021-08-16'),
(3, 'Kathmandu', 'Jhapa', '4', 'Non AC', 1000, '2021-08-15'),
(2, 'Kathmandu', 'Pokhara', '7', 'AC', 550, '2021-08-17');

CREATE TABLE `ticket` (
  `p_id` int(6) DEFAULT NULL,
  `ticket_no` int(6) NOT NULL,
  `bus_id` varchar(20) DEFAULT NULL,
  `from_city` enum('Kathmandu','Chitwan','Jhapa','Pokhara') NOT NULL,
  `to_city` enum('Kathmandu','Chitwan','Jhapa','Pokhara') NOT NULL,
  `seat_no` int(2) NOT NULL,
  `date_of_journey` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `ticket` (`p_id`, `ticket_no`, `bus_id`, `from_city`, `to_city`, `seat_no`, `date_of_journey`) VALUES
(1, 1, '2', 'Kathmandu', 'Chitwan', 5, '2021-08-15'),
(2, 2, '2', 'Kathmandu', 'Chitwan', 7, '2021-08-16'),
(3, 3, '2', 'Chitwan', 'Kathmandu', 9, '2021-08-17'),
(4, 4, '2', 'Kathmandu', 'Pokhara', 11, '2021-08-15'),
(5, 5, '2', 'Pokhara', 'Kathmandu', 13, '2021-08-16'),
(6, 6, '6', 'Kathmandu', 'Jhapa', 15, '2021-08-17'),
(5, 7, '2', 'Jhapa', 'Kathmandu', 17, '2021-08-15'),
(4, 8, '2', 'Kathmandu', 'Pokhara', 19, '2021-08-15'),
(7, 9, '2', 'Kathmandu', 'Pokhara', 21, '2021-08-15'),
(8, 10, '4', 'Kathmandu', 'Pokhara', 23, '2021-08-15'),
(5, 11, '2', 'Kathmandu', 'Pokhara', 25, '2021-08-16'),
(9, 12, '4', 'Kathmandu', 'Jhapa', 27, '2021-08-15'),
(5, 13, '7', 'Kathmandu', 'Pokhara', 29, '2021-08-17');

DELIMITER $$
CREATE TRIGGER `bus_fare` AFTER INSERT ON `ticket` FOR EACH ROW BEGIN
UPDATE booking_info SET booking_info.bus_type="AC"  WHERE bus_id='1' or bus_id=2 or bus_id=7;
UPDATE booking_info SET booking_info.bus_type="Non AC"  WHERE bus_id=3 or bus_id=4 or bus_id=8;
UPDATE booking_info SET booking_info.bus_type="Deluxe"  WHERE bus_id=5 or bus_id=6 or bus_id=9;

UPDATE booking_info SET booking_info.fare=550  WHERE (booking_info.from_city="Kathmandu" AND booking_info.to_city="Pokhara" AND booking_info.bus_type="AC");
UPDATE booking_info SET booking_info.fare=825  WHERE (booking_info.from_city="Chitwan" AND booking_info.to_city="Kathmandu" AND booking_info.bus_type="AC");
UPDATE booking_info SET booking_info.fare=1100  WHERE (booking_info.from_city="Jhapa" AND booking_info.to_city="Kathmandu" AND booking_info.bus_type="AC");
UPDATE booking_info SET booking_info.fare=550  WHERE (booking_info.from_city="Pokhara" AND booking_info.to_city="Kathmandu" AND booking_info.bus_type="AC");
UPDATE booking_info SET booking_info.fare=1100  WHERE (booking_info.from_city="Kathmandu" AND booking_info.to_city="Jhapa" AND booking_info.bus_type="AC");
UPDATE booking_info SET booking_info.fare=825  WHERE (booking_info.from_city="Kathmandu" AND booking_info.to_city="Chitwan" AND booking_info.bus_type="AC");

UPDATE booking_info SET booking_info.fare=1200  WHERE (booking_info.from_city="Jhapa" AND booking_info.to_city="Kathmandu" AND booking_info.bus_type="Deluxe");
UPDATE booking_info SET booking_info.fare=600  WHERE (booking_info.from_city="Kathmandu" AND booking_info.to_city="Pokhara" AND booking_info.bus_type="Deluxe");
UPDATE booking_info SET booking_info.fare=600  WHERE (booking_info.from_city="Pokhara" AND booking_info.to_city="Kathmandu" AND booking_info.bus_type="Deluxe");
UPDATE booking_info SET booking_info.fare=900  WHERE (booking_info.from_city="Chitwan" AND booking_info.to_city="Kathmandu" AND booking_info.bus_type="Deluxe");
UPDATE booking_info SET booking_info.fare=900  WHERE (booking_info.from_city="Kathmandu" AND booking_info.to_city="Chitwan" AND booking_info.bus_type="Deluxe");
UPDATE booking_info SET booking_info.fare=1200  WHERE (booking_info.from_city="Kathmandu" AND booking_info.to_city="Jhapa" AND booking_info.bus_type="Deluxe");

UPDATE booking_info SET booking_info.fare=500  WHERE (booking_info.from_city="Kathmandu" AND booking_info.to_city="Pokhara" AND booking_info.bus_type="Non AC");
UPDATE booking_info SET booking_info.fare=500  WHERE (booking_info.from_city="Pokhara" AND booking_info.to_city="Kathmandu" AND booking_info.bus_type="Non AC");
UPDATE booking_info SET booking_info.fare=1000  WHERE (booking_info.from_city="Jhapa" AND booking_info.to_city="Kathmandu" AND booking_info.bus_type="Non AC");
UPDATE booking_info SET booking_info.fare=1000  WHERE (booking_info.from_city="Kathmandu" AND booking_info.to_city="Jhapa" AND booking_info.bus_type="Non AC");
UPDATE booking_info SET booking_info.fare=750  WHERE (booking_info.from_city="Chitwan" AND booking_info.to_city="Kathmandu" AND booking_info.bus_type="Non AC");
UPDATE booking_info SET booking_info.fare=750  WHERE (booking_info.from_city="Kathmandu" AND booking_info.to_city="Chitwan" AND booking_info.bus_type="Non AC");

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `test` AFTER INSERT ON `ticket` FOR EACH ROW begin
insert into booking_info(p_id,ticket_no, bus_id,from_city,to_city,seat_no,date_of_journey) values (new.p_id,new.ticket_no, new.bus_id,new.from_city,new.to_city,new.seat_no,new.date_of_journey);
END
$$
DELIMITER ;
DROP TABLE IF EXISTS `count_ticket_occupancy`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `count_ticket_occupancy`  AS SELECT `t`.`bus_id` AS `bus_id`, `b`.`bus_name` AS `bus_name`, `t`.`from_city` AS `from_city`, `t`.`to_city` AS `to_city`, count(`t`.`ticket_no`) AS `No of tickets`, `b`.`no_of_seats` AS `no_of_seats`, `t`.`date_of_journey` AS `date_of_journey` FROM (`ticket` `t` join `bus_info` `b` on(`t`.`bus_id` = `b`.`bus_number`)) GROUP BY `t`.`bus_id`, `t`.`from_city`, `t`.`to_city`, `t`.`date_of_journey` ORDER BY `t`.`bus_id` ASC ;

DROP TABLE IF EXISTS `driver_of_bus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `driver_of_bus`  AS SELECT `bd`.`driver_id` AS `driver_id`, `bd`.`name` AS `name`, `bd`.`contact_no` AS `contact_no`, `b`.`bus_name` AS `bus_name`, `b`.`bus_number` AS `bus_number`, `b`.`bus_type` AS `bus_type`, `b`.`no_of_seats` AS `no_of_seats` FROM ((`bus_schedule` `bs` join `bus_info` `b` on(`b`.`bus_number` = `bs`.`bus_id`)) join `bus_driver` `bd` on(`bd`.`driver_id` = `bs`.`driver_id`)) ORDER BY `bd`.`driver_id` ASC ;

ALTER TABLE `booking_info`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `p_id` (`p_id`),
  ADD KEY `bus_id` (`bus_id`),
  ADD KEY `ticket_no` (`ticket_no`);

ALTER TABLE `bus_driver`
  ADD PRIMARY KEY (`driver_id`);

ALTER TABLE `bus_info`
  ADD PRIMARY KEY (`bus_number`);

ALTER TABLE `bus_schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD UNIQUE KEY `driver_id` (`driver_id`),
  ADD KEY `bus_id` (`bus_id`);

ALTER TABLE `bus_schedule_backup`
  ADD KEY `bus_id` (`bus_id`);

ALTER TABLE `passenger`
  ADD PRIMARY KEY (`p_id`),
  ADD UNIQUE KEY `contact_no` (`contact_no`);

ALTER TABLE `route`
  ADD KEY `bus_id` (`bus_id`);

ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_no`),
  ADD KEY `p_id` (`p_id`),
  ADD KEY `bus_id` (`bus_id`);

ALTER TABLE `booking_info`
  MODIFY `booking_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

ALTER TABLE `bus_schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

ALTER TABLE `passenger`
  MODIFY `p_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

ALTER TABLE `ticket`
  MODIFY `ticket_no` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

ALTER TABLE `booking_info`
  ADD CONSTRAINT `booking_info_ibfk_1` FOREIGN KEY (`ticket_no`) REFERENCES `ticket` (`ticket_no`),
  ADD CONSTRAINT `booking_info_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `passenger` (`p_id`),
  ADD CONSTRAINT `booking_info_ibfk_3` FOREIGN KEY (`bus_id`) REFERENCES `bus_info` (`bus_number`),
  ADD CONSTRAINT `booking_info_ibfk_4` FOREIGN KEY (`ticket_no`) REFERENCES `ticket` (`ticket_no`),
  ADD CONSTRAINT `booking_info_ibfk_5` FOREIGN KEY (`fare`) REFERENCES `fare` (`fare`),
  ADD CONSTRAINT `booking_info_ibfk_6` FOREIGN KEY (`fare`) REFERENCES `fare` (`fare`);

ALTER TABLE `bus_schedule`
  ADD CONSTRAINT `bus_schedule_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `bus_info` (`bus_number`),
  ADD CONSTRAINT `bus_schedule_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `bus_driver` (`driver_id`);

ALTER TABLE `bus_schedule_backup`
  ADD CONSTRAINT `bus_schedule_backup_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `bus_schedule` (`bus_id`);

ALTER TABLE `route`
  ADD CONSTRAINT `route_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `bus_info` (`bus_number`);

ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `passenger` (`p_id`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`bus_id`) REFERENCES `bus_info` (`bus_number`);
COMMIT;

