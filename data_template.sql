INSERT INTO COURSE (c_id, c_name, c_description) VALUES
INSERT INTO CUSTOMER (c_id) VALUES
INSERT INTO DEPARTMENT (d_num, d_name, mgmt_id) VALUES
INSERT INTO DEPT_PRODUCT (dp_id, d_num, product_id) VALUES
INSERT INTO EMPLOYEE (e_id, fname, lname, e_email, e_address, e_city, e_state, phone_number, ssn, birth_date, job_title, d_num, mgmt_id) VALUES
INSERT INTO LESSON (l_id, l_type, duration, cost, course_id) VALUES
INSERT INTO MANAGEMENT (mgmt_id, fname, lname, mgr_ssn) VALUES
INSERT INTO PRODUCT_COLOR (product_id, color) VALUES
INSERT INTO PRODUCT (p_id, p_name, p_group_name, for_gender, size_index, in_stock, sum_in_stock, wholesale_price, retail_price, date_received, quantity_received, location_received, vendor_id) VALUES
INSERT INTO PURCHASE (p_id, customer_id, sales_person, p_date, payment_method) VALUES
INSERT INTO PURCHASE_PRODUCT (purchase_id, product_id, num_items, total_price) VALUES
INSERT INTO STUDENT_DETAIL (sd_id, fname, lname, sd_address, sd_city, sd_state, email, birth_date, phone_number) VALUES 
INSERT INTO STUDENT (s_id, fname, lname, stud_detail_id) VALUES
INSERT INTO TEACHER (t_id, employee_id) VALUES
INSERT INTO VENDOR (v_id, v_name, v_location) VALUES 
INSERT INTO ENROLLMENT_DETAIL (ed_id, enroll_id, student_id, course_id, priv_course, group_course, pract_course, supervisor_id, teacher_id, enroll_date) VALUES 
INSERT INTO ENROLLMENT (e_id, e_date, mgmt_id) VALUES
