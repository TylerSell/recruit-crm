# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user_id = 1
Agent.create!(first_name: 'No', last_name: 'Agent', phone_number: '000-000-0001', email: 'no.agent@noemail.com', password: SecureRandom.hex(12))
# user_id = 2 
Recruiter.create!(first_name: 'No', last_name: 'Recruiter', phone_number: '000-000-0002', email: 'no.recruiter@noemail.com', password: SecureRandom.hex(12))
# user_id = 3
Agent.create!(first_name: 'Tyler', last_name: 'Sell', phone_number: '555-123-4569', email: 'tyler@email.com', password: 'password')
# user_id = 4
Recruiter.create!(first_name: 'Alyson', last_name: 'Hankins', phone_number: '555-123-4560', email: 'alyson@email.com', password: 'password')


# candidates boys
# interested
Candidate.create(first_name: 'Liam', last_name: 'Smith', email: 'liam.smith@email.com', phone_number: '555-123-4561', address_1: '2880 Fescue Rd.', address_2: 'Apt. A', city: 'St. Louis', state: 'MO', zip_code: '63101', date_of_birth: '05/20/2000', interview_date: '', test_date: '', stage: 1, affidavit_sent: false, affidavit_received: false, voucher_sent: false, test_passed: false, licensed: false, agent_id: 3, recruiter_id: 4)
# interview_set
Candidate.create(first_name: 'Noah', last_name: 'Williams', email: 'noah.williams@email.com', phone_number: '555-123-4562', address_1: '13 Second St.', address_2: '', city: 'St. Louis', state: 'MO', zip_code: '63105', date_of_birth: '05/30/1999', interview_date: '05/14/2020', test_date: '', stage: 2, affidavit_sent: false, affidavit_received: false, voucher_sent: false, test_passed: false, licensed: false, agent_id: 3, recruiter_id: 4)
# affidavit_sent
Candidate.create(first_name: 'William', last_name: 'Johnson', email: 'william.johnson@email.com', phone_number: '555-123-4563', address_1: '452 Main St.', address_2: '', city: 'Ofallon', state: 'MO', zip_code: '63367', date_of_birth: '08/13/1997', interview_date: '05/07/2020', test_date: '', stage: 3, affidavit_sent: true, affidavit_received: false, voucher_sent: false, test_passed: false, licensed: false, agent_id: 3, recruiter_id: 4)
# affidavit_received
Candidate.create(first_name: 'James', last_name: 'Jones', email: 'james.jones@email.com', phone_number: '555-123-4564', address_1: '106 Park', address_2: '', city: 'St. Louis', state: 'MO', zip_code: '63137', date_of_birth: '09/24/1998', interview_date: '05/06/2020', test_date: '', stage: 4, affidavit_sent: true, affidavit_received: true, voucher_sent: true, test_passed: false, licensed: false, agent_id: 3, recruiter_id: 4)
# studying
Candidate.create(first_name: 'Oliver', last_name: 'Brown', email: 'oliver.brown@email.com', phone_number: '555-123-4565', address_1: '1414 First St', address_2: 'Apt. 106', city: 'Ofallon', state: 'MO', zip_code: '63367', date_of_birth: '01/22/2000', interview_date: '05/04/2020', test_date: '', stage: 5, affidavit_sent: true, affidavit_received: true, voucher_sent: true, test_passed: false, licensed: false, agent_id: 3, recruiter_id: 4)
# test_scheduled
Candidate.create(first_name: 'Benjamin', last_name: 'Davis', email: 'benjamin.davis@email.com', phone_number: '555-123-4566', address_1: '1234 Oak Post Ct.', address_2: '', city: 'East St. Louis', state: 'IL', zip_code: '62201', date_of_birth: '07/16/1995', interview_date: '05/01/2020', test_date: '05/14/2020', stage: 6, affidavit_sent: true, affidavit_received: true, voucher_sent: true, test_passed: false, licensed: false, agent_id: 3, recruiter_id: 4)
# sent_to_contracting
Candidate.create(first_name: 'Elijah', last_name: 'Miller', email: 'elijah.miller@email.com', phone_number: '555-123-4570', address_1: '15 Pine St.', address_2: '', city: 'Columbia', state: 'MO', zip_code: '65201', date_of_birth: '04/20/1993', interview_date: '04/29/2020', test_date: '05/07/2020', stage: 7, affidavit_sent: true, affidavit_received: true, voucher_sent: true, test_passed: true, licensed: true, agent_id: 3, recruiter_id: 4)
# hired
Candidate.create(first_name: 'Lucas', last_name: 'Wilson', email: 'lucas.wilson@email.com', phone_number: '555-123-4571', address_1: '167 Elm Place', address_2: '', city: 'Kansas City', state: 'MO', zip_code: '64113', date_of_birth: '08/11/1990', interview_date: '04/12/2020', test_date: '05/01/2020', stage: 8, affidavit_sent: true, affidavit_received: true, voucher_sent: true, test_passed: true, licensed: true, agent_id: 3, recruiter_id: 4)
# not_interested
Candidate.create(first_name: 'Mason', last_name: 'Moore', email: 'mason.moore@email.com', phone_number: '555-123-4572', address_1: '4250 Cedar St', address_2: 'Box 12', city: 'St. Louis', state: 'MO', zip_code: '63106', date_of_birth: '02/17/2000', interview_date: '05/04/2020', test_date: '', stage: 9, affidavit_sent: false, affidavit_received: false, voucher_sent: false, test_passed: false, licensed: false, agent_id: 3, recruiter_id: 4)
# no_contact
Candidate.create(first_name: 'Logan', last_name: 'Taylor', email: 'logan.taylor@email.com', phone_number: '555-123-4573', address_1: '92 Eigth St.', address_2: '', city: 'Ofallon', state: 'MO', zip_code: '63367', date_of_birth: '', interview_date: '', test_date: '', stage: 10, affidavit_sent: false, affidavit_received: false, voucher_sent: false, test_passed: false, licensed: false, agent_id: 3, recruiter_id: 4)




# candidates girls
# interested
Candidate.create(first_name: 'Emma', last_name: 'Anderson', email: 'emma.anderson@email.com', phone_number: '555-123-4574', address_1: '1313 View Place', address_2: '', city: 'St. Louis', state: 'MO', zip_code: '63130', date_of_birth: '03/17/1994', interview_date: '', test_date: '', stage: 1, affidavit_sent: false, affidavit_received: false, voucher_sent: false, test_passed: false, licensed: false, agent_id: 3, recruiter_id: 4)
# interview_set
Candidate.create(first_name: 'Olivia', last_name: 'Thomas', email: 'olivia.thomas@email.com', phone_number: '555-123-4575', address_1: '702 7th St.', address_2: '', city: 'St. Louis', state: 'MO', zip_code: '63156', date_of_birth: '11/19/2000', interview_date: '05/10/2020', test_date: '', stage: 2, affidavit_sent: false, affidavit_received: false, voucher_sent: false, test_passed: false, licensed: false, agent_id: 3, recruiter_id: 4)
# affidavit_sent
Candidate.create(first_name: 'Ava', last_name: 'Jackson', email: 'ava.jackson@email.com', phone_number: '555-123-4576', address_1: '9190 4th St.', address_2: '', city: 'Columbia', state: 'MO', zip_code: '65203', date_of_birth: '06/19/1992', interview_date: '05/07/2020', test_date: '', stage: 3, affidavit_sent: true, affidavit_received: false, voucher_sent: false, test_passed: false, licensed: false, agent_id: 3, recruiter_id: 4)
# affidavit_received
Candidate.create(first_name: 'Isabella', last_name: 'White', email: 'isabella.white@email.com', phone_number: '555-123-4577', address_1: '10131 Third St.', address_2: 'Apt. 6A', city: 'Ofallon', state: 'MO', zip_code: '63367', date_of_birth: '07/05/1986', interview_date: '05/04/2020', test_date: '', stage: 4, affidavit_sent: true, affidavit_received: true, voucher_sent: true, test_passed: false, licensed: false, agent_id: 3, recruiter_id: 4)
# studying
Candidate.create(first_name: 'Sophia', last_name: 'Harris', email: 'sophia.harris@email.com', phone_number: '555-123-4578', address_1: '5202 Washington Ave.', address_2: '', city: 'St. Louis', state: 'MO', zip_code: '63166', date_of_birth: '08/09/1990', interview_date: '05/02/2020', test_date: '', stage: 5, affidavit_sent: true, affidavit_received: true, voucher_sent: true, test_passed: false, licensed: false, agent_id: 3, recruiter_id: 4)
# test_scheduled
Candidate.create(first_name: 'Charlotte', last_name: 'Martin', email: 'charlotte.martin@email.com', phone_number: '555-123-4579', address_1: '4877 Lake Hill Dr.', address_2: '', city: 'Kansas City', state: 'MO', zip_code: '', date_of_birth: '11/02/2001', interview_date: '05/01/2020', test_date: '05/12/2020', stage: 6, affidavit_sent: true, affidavit_received: true, voucher_sent: true, test_passed: false, licensed: false, agent_id: 3, recruiter_id: 4)
# sent_to_contracting
Candidate.create(first_name: 'Mia', last_name: 'Thompson', email: 'mia.thompson@email.com', phone_number: '555-123-4580', address_1: '5524 Watson Parkway', address_2: '', city: 'St. Louis', state: 'MO', zip_code: '63178', date_of_birth: '12/20/1998', interview_date: '04/15/2020', test_date: '05/05/2020', stage: 7, affidavit_sent: true, affidavit_received: true, voucher_sent: true, test_passed: true, licensed: true, agent_id: 3, recruiter_id: 4)
# hired
Candidate.create(first_name: 'Amelia', last_name: 'Garcia', email: 'amelia.garcia@email.com', phone_number: '555-123-4581', address_1: '4908 Hilltop Ct.', address_2: '', city: 'Columbia', state: 'MO', zip_code: '65201', date_of_birth: '03/18/1995', interview_date: '04/04/2020', test_date: '05/03/2020', stage: 8, affidavit_sent: true, affidavit_received: true, voucher_sent: true, test_passed: true, licensed: true, agent_id: 3, recruiter_id: 4)
# not_interested
Candidate.create(first_name: 'Harper', last_name: 'Martinez', email: 'harper.martinez@email.com', phone_number: '555-123-4582', address_1: '6170 Oak Tree Ln.', address_2: '', city: 'St. Louis', state: 'MO', zip_code: '63125', date_of_birth: '11/15/1996', interview_date: '05/03/2020', test_date: '', stage: 9, affidavit_sent: false, affidavit_received: false, voucher_sent: false, test_passed: false, licensed: false, agent_id: 3, recruiter_id: 4)
# no_contact
Candidate.create(first_name: 'Evelyn', last_name: 'Robinson', email: 'evelyn.robinson@email.com', phone_number: '555-123-4583', address_1: '7283 Maple Bridge Ct.', address_2: 'Apt. 1', city: 'St. Louis', state: 'MO', zip_code: '63182', date_of_birth: '05/05/1995', interview_date: '', test_date: '', stage: 10, affidavit_sent: false, affidavit_received: false, voucher_sent: false, test_passed: false, licensed: false, agent_id: 3, recruiter_id: 4)