Travel Website using JSP with REST Web Service
Created by Shanice Anne-Toni Gesmundo Talan 574165 for PROJ207 - OOSD Spring 2019
October 15 - 28, 2019

Use attached modified sql database
(Added/modified ff tables:
Agents: added AgtUserId - varchar 20, AgtUserPwd - varchar 60 (hashing will be added in the future), deleted AgtBusPhone, changed AgtHomePhone to AgtPhone
Customers: added CustUserId - varchar 20, CustUserPwd - varchar 60 (hashing will be added in the future), deleted CustBusPhone, changed CustHomePhone to CustPhone
Bookings: deleted BookingNo, changed TripTypeId to TripType - varchar 10, added TripStart - date, TripEnd - date
Packages: added PkgImg - varchar 20
Provinces (same as Day 5 Exercise): provCode - varchar 2, provName - varchar 20, country - varchar 20 )

Use Wildfly 11 server (install first to get rid of jsp errors)
Need to configure build path to add jre/jdk (I used jre 10.0.2)
might need to synchronize class list, and validate to get rid of jpa errors

Power point done by Shanice as well

Team 3:
JavaFX desktop app: Kenji Jumalon, Sabiha Mohsen
Android app: Robert Nielsen
JSP: Shanice Talan