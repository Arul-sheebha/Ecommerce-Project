-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2024 at 06:54 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mystore`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_table`
--

CREATE TABLE `admin_table` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(200) NOT NULL,
  `admin_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL,
  `brand_title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `brand_title`) VALUES
(1, 'Amazon'),
(2, 'Swiggy'),
(3, 'Zomato'),
(6, 'Mc Donalds'),
(8, 'Flipkart'),
(9, 'Eagle Books'),
(10, 'Flower Garden');

-- --------------------------------------------------------

--
-- Table structure for table `cart_details`
--

CREATE TABLE `cart_details` (
  `product_id` int(11) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `quantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_details`
--

INSERT INTO `cart_details` (`product_id`, `ip_address`, `quantity`) VALUES
(26, '::1', 0),
(37, '::1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_title`) VALUES
(1, 'Fruits'),
(2, 'Juices'),
(3, 'Vegetables'),
(4, 'Chips'),
(7, 'vehicles'),
(8, 'Toys'),
(9, 'Books'),
(10, 'Flowers'),
(11, 'Food'),
(13, 'Drawings');

-- --------------------------------------------------------

--
-- Table structure for table `orders_pending`
--

CREATE TABLE `orders_pending` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `invoice_number` int(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(255) NOT NULL,
  `order_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_title` varchar(100) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_keywords` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_image1` varchar(255) NOT NULL,
  `product_image2` varchar(255) NOT NULL,
  `product_image3` varchar(255) NOT NULL,
  `product_price` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_title`, `product_description`, `product_keywords`, `category_id`, `brand_id`, `product_image1`, `product_image2`, `product_image3`, `product_price`, `date`, `status`) VALUES
(1, 'Fresh Mango', 'Mangoes are always tasty, Eat once you will ask for more.', 'mangoes,fresh mango,zomato,green mango,yellow mango,fruit', 1, 2, 'Dune.jpg', 'Dune.jpg', 'Dune.jpg', '40', '2024-03-06 03:46:23', 'true'),
(4, 'Fresh Apples', 'An apple a day keeps doctor away. So please try it.', 'apple,fresh apple,green apple,swiggy,red apples', 1, 2, 'palm tree.jpg', 'palm tree.jpg', 'palm tree.jpg', '60', '2024-03-13 03:57:57', 'true'),
(5, 'Capsicum', 'Capsicum is very good for health, We serve best of that and you have to try it.', 'Capsicum,green capsicum,red capsicum,yellow capsicum,fresh capsicum,vegetables,bigbasket', 3, 1, 'Peppers.jpg', 'Peppers.jpg', 'Peppers.jpg', '20', '2024-03-13 03:59:40', 'true'),
(13, 'Car', 'We give the best car with good miledge, Our car is more attractive and you deserve more.', 'car,red car,green car,white car,black car,vehicle,cycle,bike,bicycle', 7, 1, 'car.jpg', 'car.jpg', 'car.jpg', '1000', '2024-03-13 04:05:45', 'true'),
(14, 'Duck Toy', 'Toys are very important to cool the childrens, We give attractive and beautiful toys .', 'Toy,Toys,duck toy,beautiful toy,cute toy,animal toy,bird toy,bath toy', 8, 8, 'Ducky.jpg', 'Ducky.jpg', 'Ducky.jpg', '50', '2024-02-28 07:04:49', 'true'),
(15, 'Onion', 'Onion is very important for cooking, It is add more taste, it is very fresh tasty and healthy.', 'onion,vegetable,healthy,food,tasty,fresh onion', 3, 8, 'onion.jpg', 'onion.jpg', 'onion.jpg', '60', '2024-03-13 04:13:36', 'true'),
(16, 'Tomato', 'Tomato is very tasty and healthy vegetable.it is make your food more tastier.', 'tomato,vegetable,red tomato,food', 3, 1, 'Tomato.jpg', 'Tomato.jpg', 'Tomato.jpg', '40', '2024-02-28 07:16:21', 'true'),
(17, 'Story Book', 'Book gives more knowledge more than our study knowledge, read and make it your habit.', 'book,story book,books,stories,study,children,education', 9, 8, 'Old Image.jpg', 'Old Image.jpg', 'Old Image.jpg', '100', '2024-03-13 04:22:55', 'true'),
(18, 'Horror Book', 'Horror book makes you more thriller.when you read the books.', 'book,books,story book,Horror books,interesting book', 9, 1, 'Ranch House.jpg', 'Ranch House.jpg', 'Ranch House.jpg', '100', '2024-03-13 04:27:24', 'true'),
(19, 'Comic Book', 'Comic books are reduce mobile usage of your children.it will prevent from mobile addiction.', 'book,books,comic book,knowledge,for children', 9, 8, 'waterfall.jpg', 'waterfall.jpg', 'waterfall.jpg', '100', '2024-03-13 04:32:31', 'true'),
(21, 'English Book', 'It is useful to learn english and talk in english, So please buy it and give it to your learner.', 'book,eagle book,knowledge,education,english book,learn english', 9, 9, 'boat.jpg', 'boat.jpg', 'boat.jpg', '60', '2024-03-13 04:33:58', 'true'),
(22, 'Brinjal', 'Brinjal is the very healthy vegetable, please eat it don`t avoid some healthy things.', 'brinjal,vegetables,tasty,cooking,healthy.', 3, 8, 'brinjal.jpg', 'brinjal.jpg', 'brinjal.jpg', '50', '2024-03-05 06:41:36', 'true'),
(23, 'Social Book', 'This book is change selfishness into socialism, It is change you to think about world.', 'social book,books,knowledge,social,education,children', 9, 9, 'Eagle.jpg', 'Eagle.jpg', 'Eagle.jpg', '200', '2024-03-05 06:50:42', 'true'),
(26, 'Sun Flower', 'Flowers are so beautiful, this sun flower smell is give freshness and buy it.', 'flower,sun flower,smell,beauty,nature,flower garden', 10, 10, 'Flower.jpg', 'Flower.jpg', 'Flower.jpg', '40', '2024-03-05 06:59:21', 'true'),
(27, 'Flower Painting', 'Paintings are very beautiful, Some kind of paintings look like a real one.', 'painting,flower,beautiful,flower garden', 10, 10, 'flower1.jpg', 'flower1.jpg', 'flower1.jpg', '100', '2024-03-05 07:01:33', 'true'),
(31, 'Pasta', 'Pasta is very tasty food, Eat once you will ask for more...So please try it', 'pasta,food,fast food,street food,tasty,hotel,swiggy,zomato', 11, 2, 'Pasta.jpg', 'Pasta.jpg', 'Pasta.jpg', '200', '2024-03-05 07:14:27', 'true'),
(33, 'Watermelon', 'It is very tasty one, It is provide more water to your body, And it is very useful in summer.', 'watermelon,fruit,tasty,swiggy,summer,cool,water', 1, 2, 'vegitable.jpg', 'vegitable.jpg', 'vegitable.jpg', '300', '2024-03-13 04:52:55', 'true'),
(35, 'Fish Curry ', 'Fish is very tasty food and healthy too, More people like fish more than other non veg items.', 'fish,healthy,non veg,tasty,food,curry,cook', 11, 2, 'fish.jpg', 'fish.jpg', 'fish.jpg', '400', '2024-03-05 07:51:07', 'true'),
(37, 'Fruits', 'Fruits is very healthy. It is not only the fruit it is also a skincare and medicine for your problems.', 'Fruits,snacks,healthy,food,tasty', 1, 1, 'Fruit.jpg', 'Fruit.jpg', 'Fruit.jpg', '100', '2024-03-13 05:01:03', 'true'),
(38, 'Juice', 'Juice is very healthy and tasty, It is give more energy to your body and very useful to skincare.', 'juice,drinks,energy,healthy', 2, 8, 'juice.jpg', 'juice.jpg', 'juice.jpg', '200', '2024-03-13 05:03:27', 'true'),
(40, 'Drawings', 'Drawings are very beautiful, It is track you to nature and give some positive vibe.', 'drawing,feel good,beautiful,calm,image', 13, 10, 'drawing.jpg', 'drawing.jpg', 'drawing.jpg', '50', '2024-03-13 03:48:30', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `user_orders`
--

CREATE TABLE `user_orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount_due` int(255) NOT NULL,
  `invoice_number` int(255) NOT NULL,
  `total_products` int(255) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_payments`
--

CREATE TABLE `user_payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `invoice_number` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_mode` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_image` varchar(255) NOT NULL,
  `user_ip` varchar(100) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `user_mobile` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_table`
--
ALTER TABLE `admin_table`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `orders_pending`
--
ALTER TABLE `orders_pending`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_orders`
--
ALTER TABLE `user_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `user_payments`
--
ALTER TABLE `user_payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_table`
--
ALTER TABLE `admin_table`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders_pending`
--
ALTER TABLE `orders_pending`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `user_orders`
--
ALTER TABLE `user_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_payments`
--
ALTER TABLE `user_payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
