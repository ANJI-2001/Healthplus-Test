import xml.etree.ElementTree as ET

# Load the XML data
tree = ET.parse('hospital_data.xml')
root = tree.getroot()

def patient_login(username, password):
    for patient in root.findall('.//patient'):
        if patient.find('username').text == username and patient.find('password').text == password:
            return True
    return False

def display_doctors():
    doctors = root.findall('.//doctor')
    for doctor in doctors:
        print(doctor.find('name').text)
        # Display other doctor information

# Usage
username = input("Enter username: ")
password = input("Enter password: ")

if patient_login(username, password):
    print("Login successful!")
    print("Doctors available:")
    display_doctors()
else:
    print("Invalid credentials!")
