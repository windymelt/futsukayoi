DROP TABLE IF EXISTS futsukayoi;
CREATE TABLE futsukayoi (
  dt DATE NOT NULL,
  dead TINYINT(1) NOT NULL,
  PRIMARY KEY (dt),
  KEY (dead)
) ENGINE=innodb DEFAULT CHARSET=utf8mb4;
