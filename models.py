from peewee import *

database = MySQLDatabase('hopes_wings', **{'charset': 'utf8', 'use_unicode': True, 'host': 'localhost', 'user': 'root', 'password': 'david'})

class UnknownField(object):
    def __init__(self, *_, **__): pass

class BaseModel(Model):
    class Meta:
        database = database

class Donation(BaseModel):
    amount = DecimalField(column_name='Amount')
    comment = CharField(column_name='Comment', null=True)
    date = DateField(column_name='Date')
    donation_id = AutoField(column_name='DonationID')
    letter_sent = CharField(column_name='LetterSent')

    class Meta:
        table_name = 'Donation'

class Cash(BaseModel):
    amount = DecimalField(column_name='Amount')
    cash_id = AutoField(column_name='CashID')
    donation = ForeignKeyField(column_name='DonationID', field='donation_id', model=Donation)

    class Meta:
        table_name = 'Cash'

class CheckTable(BaseModel):
    amount = DecimalField(column_name='Amount')
    check_id = AutoField(column_name='CheckID')
    check_number = IntegerField(column_name='CheckNumber')
    donation = ForeignKeyField(column_name='DonationID', field='donation_id', model=Donation)

    class Meta:
        table_name = 'CheckTable'

class Donors(BaseModel):
    address = CharField(column_name='Address', null=True)
    city = CharField(column_name='City', null=True)
    comment = CharField(column_name='Comment', null=True)
    donor_id = AutoField(column_name='DonorID')
    donor_name = CharField(column_name='DonorName')
    email_address = CharField(column_name='EmailAddress', null=True)
    phone_number = IntegerField(column_name='PhoneNumber', null=True)
    state = CharField(column_name='State', null=True)
    zip = IntegerField(column_name='Zip', null=True)

    class Meta:
        table_name = 'donors'

class DonorsToDonations(BaseModel):
    dtd_id = AutoField(column_name='DTD_ID')
    donation = ForeignKeyField(column_name='DonationID', field='donation_id', model=Donation)
    donor = ForeignKeyField(column_name='DonorID', field='donor_id', model=Donors)

    class Meta:
        table_name = 'DonorsToDonations'

class Eft(BaseModel):
    amount = DecimalField(column_name='Amount')
    donation = ForeignKeyField(column_name='DonationID', field='donation_id', model=Donation)
    eftid = AutoField(column_name='EFTID')

    class Meta:
        table_name = 'EFT'

class Grant(BaseModel):
    amount = DecimalField(column_name='Amount')
    donation = ForeignKeyField(column_name='DonationID', field='donation_id', model=Donation)
    grant_id = AutoField(column_name='GrantID')
    grant_name = CharField(column_name='GrantName')

    class Meta:
        table_name = 'Grant'

class InKind(BaseModel):
    amount = DecimalField(column_name='Amount')
    donation = ForeignKeyField(column_name='DonationID', field='donation_id', model=Donation)
    in_kind_id = AutoField(column_name='InKindID')
    item_given = CharField(column_name='ItemGiven')

    class Meta:
        table_name = 'In Kind'

class PayPal(BaseModel):
    amount = DecimalField(column_name='Amount')
    donation = ForeignKeyField(column_name='DonationID', field='donation_id', model=Donation)
    pay_pal_id = AutoField(column_name='PayPalID')
    receipt_number = CharField(column_name='ReceiptNumber', null=True)

    class Meta:
        table_name = 'PayPal'


# Practice query
def getDonorsByID(db, donorID):
    sql_query = "SELECT * FROM donors WHERE DonorID = " + str(donorID)
    return db.execute_sql(sql_query).fetchall()
database.connect()
#query = getDonorsByID(database, 10)
query = TotalAmountbyAlltimeByDonorID(database, 1)
print(query[0])
database.close()

#This query shows the amount donated in a particular year by a donor with DonorID ___
def AmountByYearByDonorID(db, donorID):
    return db.execute_sql("SELECT SUM(Donation.Amount) FROM donors INNER JOIN DonorsToDonations ON donors.DonorID INNER JOIN Donation ON Donation.DonationID WHERE Donation.Date >= '2020-01-01 00:00:00' and Date < '2021-01-01 00:00:00' and donors.DonorID= " + str(donorID)).fetchall()

#This query shows the total amount of donation made by a donor with DonorID ___ since the beginning of time
def TotalAmountbyAlltimeByDonorID(db, donorID):
    return db.execute_sql("SELECT SUM(Donation.Amount) FROM donors INNER JOIN DonorsToDonations ON donors.DonorID INNER JOIN Donation ON Donation.DonationID WHERE donors.DonorID= " + str(donorID)).fetchall()

#This query shows the number of donors for a particular year
def NumberOfDonorsByYear(db):
    return db.execute_sql("SELECT DISTINCT COUNT(donors.DonorID) FROM donors INNER JOIN DonorsToDonations ON donors.DonorID INNER JOIN Donation ON Donation.DonationID WHERE Donation.Date >= '2020-01-01 00:00:00' and Date < '2021-01-01 00:00:00'").fetchall()

#This query list all donations and its information (Date, comment, amount, type, donor) for all time (from the beginning of time)
def AllDonationsByAlltime(db):
    return db.execute_sql("SELECT * FROM `Donation` INNER JOIN DonorsToDonations WHERE DonorsToDonations.DonationID= Donation.DonationID").fetchall()

#This query list all donations and its information (Date, comment, amount, type, donor) for a particular year
def AllDonationsByYear(db):
    return db.execute_sql("SELECT * FROM `Donation` INNER JOIN DonorsToDonations WHERE DonorsToDonations.DonationID= Donation.DonationID AND Donation.Date >= '2020-01-01 00:00:00' and Date < '2021-01-01 00:00:00'").fetchall()

#This query shows whether thank you letter is sent for a donation
def LetterSentCheck(db, donationID):
    return db.execute_sql("SELECT Donation.LetterSent FROM Donation WHERE DonationID" + str(donationID)).fetchall()

#This query shows the total amount donated since the beginning of time (excluding grants)
def TotalAmountDonatedByAlltime(db):
    return db.execute_sql("SELECT SUM(Amount) FROM `Donation`").fetchall()

#This query shows the total amount donated for a particular year (ex: 2019) (excluding grant) 
def TotalAmountDonatedByYear(db):
    return db.execute_sql("SELECT SUM(Amount) FROM `Donation` WHERE Date >= '2020-01-01 00:00:00' and Date < '2021-01-01 00:00:00'").fetchall()

#This query shows the total amount of grant received since the beginning of time
def TotalGrantByAlltime(db):
    return db.execute_sql("SELECT SUM(Amount) FROM `Grant`").fetchall()

#This query shows the total amount of grant received for one year
def TotalGrantByYear(db):
    return db.execute_sql("SELECT * FROM `Donation` WHERE Date >= '2020-01-01 00:00:00' and Date < '2021-01-01 00:00:00' and DonationType='Grant'").fetchall()

#This query list all donors and their information (DonorName, Address, City, State, Zip, Comment, Email, Phone) for all time (from the beginning of time)
def AllDonorInformationByAlltime(db):
    return db.execute_sql("SELECT DonorName,Address,City,State,Zip,Comment,EmailAddress,PhoneNumber FROM donors").fetchall()

#This query list all donors and their information (DonorName, Address, City, State, Zip, Comment, Email, Phone) for this current year only
def AllDonorInformationByYear(db):
    return db.execute_sql("SELECT DISTINCT donors.DonorName,donors.Address,donors.City,donors.State,donors.Zip,donors.Comment,donors.EmailAddress,donors.PhoneNumber FROM donors INNER JOIN DonorsToDonations AS dtd ON dtd.DonorID INNER JOIN Donation ON Donation.DonationID WHERE Donation.Date >= '2020-01-01 00:00:00' and Donation.Date < '2021-01-01 00:00:00'").fetchall()

#This query shows the number of donors for all time (from the beginning of time)
def AllDonorAllTime(db):
    return db.execute_sql("SELECT COUNT(*) FROM donors").fetchall()

#This query update data for a donor – DonorName, Address, City, State, Zip, Comment, Email, Phone)
def UpdateDonor(db, donorID):
    db.execute_sql("SELECT DonorName, Address, City,State,Zip,Comment,EmailAddress, PhoneNumber FROM donors WHERE DonorID = 1;UPDATE donors SET EmailAddress = `hello@gmail.com` WHERE DonorID = " + str(donorID))
    db.execute_sql("SELECT DonorName, Address, City,State,Zip,Comment,EmailAddress, PhoneNumber FROM donors WHERE DonorID = 1;UPDATE donors SET Phone = NULL WHERE DonorID = " + str(donorID))
    db.execute_sql("SELECT DonorName, Address, City,State,Zip,Comment,EmailAddress, PhoneNumber FROM donors WHERE DonorID = 1;UPDATE donors SET Address = NULL WHERE DonorID = " + str(donorID))
    db.execute_sql("SELECT DonorName, Address, City,State,Zip,Comment,EmailAddress, PhoneNumber FROM donors WHERE DonorID = 1;UPDATE donors SET City = NULL WHERE DonorID = " + str(donorID))
    db.execute_sql("SELECT DonorName, Address, City,State,Zip,Comment,EmailAddress, PhoneNumber FROM donors WHERE DonorID = 1;UPDATE donors SET State = NULL WHERE DonorID = " + str(donorID))
    db.execute_sql("SELECT DonorName, Address, City,State,Zip,Comment,EmailAddress, PhoneNumber FROM donors WHERE DonorID = 1;UPDATE donors SET Zip = NULL WHERE DonorID = " + str(donorID))
    db.execute_sql("SELECT DonorName, Address, City,State,Zip,Comment,EmailAddress, PhoneNumber FROM donors WHERE DonorID = 1;UPDATE donors SET Comment = NULL WHERE DonorID = " str(donorID))
#This query delete a donor
def DeleteDonor(db, donorID):
    db.execute_sql("DELETE FROM donors WHERE DonorID = "+str(donorID))

#This query shows the date of the last thank you letter sent for a particular donor
def LastLetterDateByDonorID(db):
    return db.execute_sql("SELECT DonorID, Donation.LetterSent, MAX(Donation.Date) AS date_last_donation FROM Donation INNER JOIN DonorsToDonations AS dtd ON dtd.DonorID WHERE DonorID = " +str(donorID) + "AND Donation.LetterSent = 'yes' GROUP BY Donation.LetterSent").fetchall()
    
#This query shows all the donation made by the donor which thank you letter had not been sent to, as well as the date, amount, and type of each of those donations
def AllDonationsByDonorNoLetter(db):
    return db.execute_sql("SELECT * ,Date,Amount,DonationType FROM `Donation` WHERE LetterSent = 'NO'").fetchall()

#This query shows the donor name, address, city, state, zip, email, and phone for a donor whose DonorID is _____ 

#This query shows the date, amount, and type of the donation, for the donations selected by the user to send thank you letter to, and the sum of all the donations selected

#This query list all grants and its information (Date, grant name, amount, comment) for a particular year

#This query list all grants and its information (Date, grant name, amount, funding source?, comment) for all time

#This query update data for a grant – grant name, amount)

#This query inserts a new grant – grant name, amount)

#This query list all donations and its information (Date, comment, amount, type) made by a particular donor with DonorID ___

#This query shows the 5 top donors for all time (from the beginning of time)

#This query shows the 5 top donors for this year only

#This query update data for a donation – Address, City, State, Zip, Comment, Email, Phone, type, amount, comments)

#This query inserts a new donation (Data: Date, DonorName, Address, City, State, Zip, Comment, Email, Phone, type, amount, comments) – if the donor doesn’t exist, make a new donor; otherwise, if donor already exists, simply add a donation to the donor.

