-- 1. Создание таблицы автомобилей
CREATE TABLE Cars (
    car_id INT PRIMARY KEY AUTO_INCREMENT,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    license_plate VARCHAR(20) UNIQUE NOT NULL,
    year INT NOT NULL,
    car_class VARCHAR(20) NOT NULL,
    daily_rate DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) DEFAULT 'Доступен'
);

-- 2. Создание таблицы клиентов
CREATE TABLE Clients (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL,
    passport_data VARCHAR(50) NOT NULL,
    driving_experience INT NOT NULL,
    registration_date DATE DEFAULT (CURRENT_DATE)
);

-- 3. Создание таблицы бронирований с внешними ключами (связями)
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    car_id INT,
    client_id INT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_cost DECIMAL(10, 2) NOT NULL,
    deposit_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) DEFAULT 'Новый',
    FOREIGN KEY (car_id) REFERENCES Cars(car_id) ON DELETE CASCADE,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id) ON DELETE CASCADE
);

-- 4. Заполнение базы данных тестовыми данными
INSERT INTO Cars (brand, model, license_plate, year, car_class, daily_rate, status) VALUES
('Hyundai', 'Solaris', 'А123БВ777', 2022, 'Эконом', 2500.00, 'Доступен'),
('Toyota', 'Camry', 'Е777КХ99', 2023, 'Комфорт', 5000.00, 'В прокате'),
('BMW', '5er', 'Х555ХХ77', 2022, 'Бизнес', 9000.00, 'На ТО');

INSERT INTO Clients (full_name, phone, email, passport_data, driving_experience) VALUES
('Иванов Алексей Дмитриевич', '+79991112233', 'alex@example.com', '4515 123456', 5),
('Петров Сергей Валентинович', '+79994445566', 'petrov@example.com', '4516 654321', 1);

INSERT INTO Bookings (car_id, client_id, start_date, end_date, total_cost, deposit_amount, status) VALUES
(2, 1, '2026-10-15', '2026-10-18', 15000.00, 10000.00, 'Активен');
