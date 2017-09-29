DROP TABLE IF EXISTS futsukayoi;
CREATE TABLE futsukayoi (
  dt DATE NOT NULL,
  dead TINYINT(1) NOT NULL,
  PRIMARY KEY (dt),
  KEY (dead)
) ENGINE=innodb DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS drinking;
CREATE TABLE drinking (
  dt DATETIME NOT NULL,
  drink VARCHAR(32) NOT NULL,
  KEY (dt),
  KEY (drink)
) ENGINE=innodb DEFAULT CHARSET=utf8mb4;
