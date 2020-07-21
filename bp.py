import subprocess as sp
import pymysql
import pymysql.cursors

def hireANurse():
    try:
        row = {}
        print("Enter new nurse's details: ")
        row["Name"] = input("Enter Nurse name: ")
        row["Phone_Number"] = input("Phone Number: ")
        row["Patient_ID"] = int(input("Enter Patient ID "))
        row["Supervisor_ID"] = int(input("Enter supervisor ID: "))
        row["Working_Hours"] = input("Working Hours: ")
        row["Nurse_ID"] = int(input("Nurse ID: "))

        """
        In addition to taking input, you are required to handle domain errors as well
        For example: the SSN should be only 9 characters long
        Sex should be only M or F
        If you choose to take Super_SSN, you need to make sure the foreign key constraint is satisfied
        HINT: Instead of handling all these errors yourself, you can make use of except clause to print the error returned to you by MySQL
        """

        query = "INSERT INTO NURSE(PHONE_NUMBER, NAME, SUPERVISOR_ID, PATIENT_ID, WORKING_HOURS, NURSE_ID) VALUES('%s', '%s', '%d', '%d', '%s', '%d')" %(row["Phone_Number"], row["Name"], row["Supervisor_ID"], row["Patient_ID"], row["Working_Hours"], row["Nurse_ID"])
        q2 = "INSERT INTO NURSE_PHONE_NUMBER(NURSE_ID,PHONE_NUMBER) VALUES ('%d','%s')" % (row["Nurse_ID"] , row["Phone_Number"])

        print(query)
        cur.execute(query)
        con.commit()

        cur.execute(q2)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)
        
    return

def NurseWorkingHours():
    try:
        global cur
        NurseID= int(input("Enter NurseID: "))
        NewHours = input("Enter new working hours: ") 
        query = "UPDATE NURSE SET WORKING_HOURS = '%s' WHERE NURSE_ID = %d" %(NewHours,NurseID)

        print(query)

        cur.execute(query)
        print("Edited Databse")
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)
        
    finally:
        return

def DoctorWorkingHours():
    try:
        global cur
        row = {}
        DoctorID= int(input("Enter DoctorID: "))
        NewHours = input("Enter new working hours: ") 
        query = "UPDATE DOCTOR SET WORKING_HOURS = '%s' WHERE DOCTOR_ID = %d" %(NewHours,DoctorID)
        print(query)

        cur.execute(query)
        print("Edited Databse")
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)
        
    finally:
        return

def SetPatientRoom():
    try:
        global cur
        row = {}
        PatientID= int(input("Enter PatientID: "))
        NewRoom = int(input("Enter new patient room: "))
        query = "UPDATE PATIENT SET ROOM_NUMBER = %d WHERE PATIENT_ID = %d" %(NewRoom,PatientID)

        print(query)

        cur.execute(query)
        print("Edited Databse")
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)
        
    finally:
        return

def PatientDischarge():
    try:
        global cur
        row = {}
        PatientID= int(input("Enter PatientID: "))
        q = "DELETE FROM ADMISSION WHERE PATIENT_ID = %d" % (PatientID)
        query = "DELETE FROM PATIENT WHERE PATIENT_ID = %d" %(PatientID)
        query2 = "DELETE FROM PATIENT_BILL WHERE PATIENT_ID = %d" %(PatientID)
        q3 = "DELETE FROM MEDICLAIM_POLICY WHERE PATIENT_ID = %d" % (PatientID)
        # q4 = "DELETE FROM PATIENT_BILL_DISTRICT WHERE PATIENT_ID = %d" % (PatientID)
        # q5 = "DELETE FROM PATIENT_DISTRICT WHERE PATIENT_ID = %d" % (PatientID)
        q6 = "DELETE FROM PATIENT_EMAIL_ID WHERE PATIENT_ID = %d" % (PatientID)
        q7 = "DELETE FROM PATIENT_PHONE_NUMBER WHERE PATIENT_ID = %d" % (PatientID)

        print(query2)
        
        cur.execute(q)
        con.commit()

        cur.execute(q3)
        con.commit()

        cur.execute(q6)
        con.commit()

        cur.execute(q7)
        con.commit()

        cur.execute(query2)
        print("SUCCESSFULLY DELETED PATIENT_BILL")
        con.commit()
        print(query)
        cur.execute(query)
        print("SUCCESSFULLY DISCHARGED PATIENT")
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)
        
    finally:
        return

def DoctorResignation():
    try:
        global cur
        row = {}
        DoctorID= int(input("Enter DoctorID: "))
        query = "DELETE FROM DOCTOR WHERE DOCTOR_ID = %d" %(DoctorID)
        q2 = "DELETE FROM ADMISSION WHERE DOCTOR_ID = %d" %(DoctorID)
        q3 = "DELETE FROM SURGEON WHERE DOCTOR_ID = %d" %(DoctorID)
        q4 = "DELETE FROM PHYSICIAN WHERE DOCTOR_ID = %d" %(DoctorID)
        q6 = "DELETE FROM DOCTOR_PHONE_NUMBER WHERE DOCTOR_ID = %d" %(DoctorID)
        q5 = "DELETE FROM PATIENT_BILL WHERE DOCTOR_ID = %d" %(DoctorID)

        print(query)

        cur.execute(q2)
        con.commit()

        cur.execute(q3)
        con.commit()

        cur.execute(q4)
        con.commit()

        cur.execute(q5)
        con.commit()

        cur.execute(q6)
        con.commit()



        cur.execute(query)
        print("SUCCESSFULLY DELETED")
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)
        
    finally:
        return

def hireDoc():

    # Takes new doctor details

    try:
        row = {}
        print("Enter new doctor's details: ")
        row["NAME"] = input("Name: ")
        row["DOCTOR_ID"] = int(input("ID: "))
        row["DEPARTMENT"] = int(input("Department: "))
        row["SEX"] = input("Sex: ")
        row["PHONE_NUMBER"] = input("Phone no: ")
        row["WORKING_HOURS"] = input("Working Hours: ")

        # """
        # In addition to taking input, you are required to handle domain errors as well
        # For example: the SSN should be only 9 characters long
        # Sex should be only M or F
        # If you choose to take Super_SSN, you need to make sure the foreign key constraint is satisfied
        # HINT: Instead of handling all these errors yourself, you can make use of except clause to print the error returned to you by MySQL
        # """

        query = "INSERT INTO DOCTOR(NAME, DOCTOR_ID, DEPARTMENT, SEX, PHONE_NUMBER, WORKING_HOURS ) VALUES ('%s', '%d', '%d', '%c','%s','%s')" % (row["NAME"], row["DOCTOR_ID"] , row["DEPARTMENT"], row["SEX"] , row["PHONE_NUMBER"], row["WORKING_HOURS"])
        q2 = "INSERT INTO DOCTOR_PHONE_NUMBER(DOCTOR_ID,PHONE_NUMBER) VALUES ('%d','%s')" % (row["DOCTOR_ID"] , row["PHONE_NUMBER"])

        print(query)
        cur.execute(query)
        con.commit()

        cur.execute(q2)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)
            
    return

def admitPatient():
    
    # Takes Patient details

    try:
        row = {}
        print("Enter new patient's details: ")
        row["NAME"] = input("Name: ")
        # row["AGE"] = int(input("Age: "))
        row["PATIENT_ID"] = int(input("ID: "))
        row["PHONE_NUMBER"] = input("Ph no: ")
        row["EMAIL"] = input("Email ID: ")  
        row["DOB"] = input("DOB(YYYY-MM-DD): ")
        row["SEX"] = input("Sex: ")
        row["DOCTOR_ID"] = int(input("Doctor ID: "))
        row["NURSE_ID"] = int(input("Nurse ID: "))
        row["ROOM_NUMBER"] = int(input("Room Number: "))

        # """
        # In addition to taking input, you are required to handle domain errors as well
        # For example: the SSN should be only 9 characters long
        # Sex should be only M or F
        # If you choose to take Super_SSN, you need to make sure the foreign key constraint is satisfied
        # HINT: Instead of handling all these errors yourself, you can make use of except clause to print the error returned to you by MySQL
        # """

        query = "INSERT INTO PATIENT(NAME, PATIENT_ID, PHONE_NUMBER, EMAIL, DATE_OF_BIRTH, SEX ,DOCTOR_ID, NURSE_ID, ROOM_NUMBER) VALUES ('%s', '%d', '%s','%s','%s','%s', '%d','%d','%d')" % (row["NAME"], row["PATIENT_ID"], row["PHONE_NUMBER"] , row["EMAIL"] , row["DOB"] , row["SEX"], row["DOCTOR_ID"], row["NURSE_ID"], row["ROOM_NUMBER"])
        q2 = "INSERT INTO ADMISSION(PATIENT_ID, DOCTOR_ID,NURSE_ID,ROOM_NUMBER) VALUES ('%d','%d','%d','%d')" % (row["PATIENT_ID"],row["DOCTOR_ID"],row["NURSE_ID"],row["ROOM_NUMBER"])

        print(query)
        cur.execute(query)
        con.commit()

        cur.execute(q2)
        con.commit()

        print("Inserted Into Database")

        query = "SELECT DEPARTMENT FROM DOCTOR WHERE DOCTOR_ID = " + str(row["DOCTOR_ID"])

        cur.execute(query)
        rows = cur.fetchall()
        dept = rows[0]["DEPARTMENT"]
        print(dept)

        con.commit()


        row["DAYS_OF_STAY"] = int(input("Enter days of stay for patient: "))
        query = "INSERT INTO PATIENT_BILL(PATIENT_ID, ROOM_OF_PATIENT, BILL_AMOUNT, DOCTOR_DEPARTMENT, DAYS_OF_STAY, DOCTOR_ID) VALUES ('%d','%d','%d','%d','%d','%d')" % (row["PATIENT_ID"],row["ROOM_NUMBER"],row["DAYS_OF_STAY"]*200 , dept ,row["DAYS_OF_STAY"],row["DOCTOR_ID"])

        cur.execute(query)

        con.commit()

        print("Inserted into patient bill table.")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)
        
    return

def addRoom():

    # takes room number

    try:
        row = {}
        row["ROOM_NUMBER"] = int(input("Enter room number: "))

        query = "INSERT INTO ROOM(ROOM_NUMBER) VALUES ('%d')"  % (row["ROOM_NUMBER"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)
            
    return

def patientRoom():  

    # Take room type

    try:

        room = int(input("Enter room type [Number only]\n(1. ICU    2. Ventilator   3. Ward): "))

        query = "SELECT * FROM PATIENT WHERE ROOM_NUMBER = %d" %(room)

        print(query)

        cur.execute(query)
        rows = cur.fetchall()

        print(" ")

        for row in rows:
            print("NAME: ",row["NAME"])
            print("ID: ",row["PATIENT_ID"])
            print("PHONE NUMBER: ",row["PHONE_NUMBER"])
            print("EMAIL: ",row["EMAIL"])  
            print("DATE OF BIRTH: ",row["DATE_OF_BIRTH"])
            print("SEX: ",row["SEX"])
            print("DOCTOR ID: ",row["DOCTOR_ID"])
            print("NURSE ID: ",row["NURSE_ID"])
            print("ROOM NUMBER: ",row["ROOM_NUMBER"])
            print()
        con.commit()

    except Exception as e:
        con.rollback()
        print("Failed to obtain values from database")
        print (">>>>>>>>>>>>>", e)
                        
    return

def patientBill():

    # Take patient ID

    try:

        pid = int(input("Enter patient ID: "))

        query = "SELECT * FROM PATIENT_BILL WHERE PATIENT_ID = "+ str(pid)

        print(query)

        cur.execute(query)
        rows = cur.fetchall()
        
        print(" ")

        for row in rows:
            print("ID: ",row["PATIENT_ID"])
            print("ROOM: ",row["ROOM_OF_PATIENT"])
            print("AMOUNT: ",row["BILL_AMOUNT"])
            print("DOCTOR DEPARTMENT: ",row["DOCTOR_DEPARTMENT"])
            print("DAYS OF STAY:",row["DAYS_OF_STAY"])
            print("DOCTOR ID: ",row["DOCTOR_ID"])
            print(" ")

        con.commit()

    except Exception as e:
        con.rollback()
        print("Failed to obtain values from database")
        print (">>>>>>>>>>>>>", e)
                    
    return

def listDoc():

    # Take department name

    try:

        dept = int(input("Enter department: "))

        query = "SELECT * FROM DOCTOR WHERE DEPARTMENT = '" + str(dept) + "'"

        print(query)

        cur.execute(query)
        rows = cur.fetchall()

        print(" ")

        for row in rows:
            print("PHONE_NUMBER: ",row["PHONE_NUMBER"])
            print("NAME: ",row["NAME"])
            print("DEPARTMENT: ",row["DEPARTMENT"])
            print("SEX: ",row["SEX"])
            print("WORKING_HOURS: ",row["WORKING_HOURS"])
            print("DOCTOR_ID: ",row["DOCTOR_ID"])
            print(" ")

        con.commit()

    except Exception as e:
        con.rollback()
        print("Failed to obtain values from database")
        print (">>>>>>>>>>>>>", e)
                
    return

def NurseResign():
    try:
        global cur
        row = {}
        NurseID= int(input("Enter NurseID: "))
        query = "DELETE FROM NURSE WHERE NURSE_ID = %d" %(NurseID)
        q2 = "DELETE FROM ADMISSION WHERE NURSE_ID = %d" %(NurseID)
        q3 = "DELETE FROM NURSE_PHONE_NUMBER WHERE NURSE_ID = %d" %(NurseID)

        print(query)

        cur.execute(q2)
        con.commit()

        cur.execute(q3)
        con.commit()

        cur.execute(query)
        print("SUCCESSFULLY DELETED")
        con.commit()

        

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)
        
    finally:
        return

def dispatch(ch):
    if(ch==2): 
        hireANurse()
    elif(ch==7):
        NurseWorkingHours()
    elif(ch==6):
        DoctorWorkingHours()
    elif(ch==11):
        PatientDischarge()
    elif ch==13:
        DoctorResignation()
    elif ch==5:
        SetPatientRoom()
    elif ch==1:
        hireDoc()
    elif ch==4:
        admitPatient()
    elif ch==3:
        addRoom()
    elif ch==9:
        patientRoom()
    elif ch==8:
        patientBill()
    elif ch==10:
        listDoc()
    elif ch==12:
        NurseResign()
    else:
        print("Error: Invalid Option")


while(1):
    tmp = sp.call('clear',shell=True)
    username = input("Username: ")
    password = input("Password: ")

    try:
        con = pymysql.connect(host='localhost',
                user=username,
                password=password,
                db='HOSPITAL',
                cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear',shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")
        tmp = input("Enter any key to CONTINUE>")

        with con:
            cur = con.cursor()
            while(1):
                tmp = sp.call('clear',shell=True)
                print("1. Hire a Doctor")
                print("2. Hire a new Nurse")
                print("3. Add a room")
                print("4. Admit a Patient")
                print("5. Update a patients room")
                print("6. Change doctor working hours")
                print("7. Change nurse working hours")
                print("8. Show patient Bill")
                print("9. Show all patients with same room type")
                print("10. List all doctors in the same department")
                print("11. Patient Discharge")
                print("12. Nurse resignation")
                print("13. Doctor Resignation")
                print("14. Logout")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear',shell=True)
                if ch==14:
                    break
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")


    except:
        tmp = sp.call('clear',shell=True)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")