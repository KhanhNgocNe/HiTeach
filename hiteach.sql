-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
<<<<<<< HEAD
-- Máy chủ: localhost
-- Thời gian đã tạo: Th4 28, 2023 lúc 06:08 PM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 8.0.19
=======
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 21, 2023 lúc 09:26 AM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 8.1.10
>>>>>>> origin/main

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `hiteach`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `authority`
--

<<<<<<< HEAD
=======
use `heroku_32135f68b6b1b95`;

>>>>>>> origin/main
CREATE TABLE `authority` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `authority`
--

INSERT INTO `authority` (`name`) VALUES
('ROLE_ADMIN'),
('ROLE_TEACHER'),
('ROLE_USER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog`
--

CREATE TABLE `blog` (
  `id` bigint(20) NOT NULL,
<<<<<<< HEAD
  `content` mediumtext DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `image_banner` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `views` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `blog`
--

INSERT INTO `blog` (`id`, `content`, `created_date`, `image_banner`, `user_id`, `description`, `title`, `views`) VALUES
(5, '<h4 id=\"subqmenu4\">1. Sign up for GPT Chat with SMSPool</h4>\n<ul>\n<li><strong>Quick guide</strong></li>\n</ul>\n<p>Buy a virtual phone number at the website <a href=\"https://www.smspool.net/\" target=\"_blank\" rel=\"nofollow noopener\">https://www.smspool.net </a>&gt; Go to ChatGPT homepage &gt; Select Sign up &gt; Enter Gmail account &gt; Set a password &gt; Choose Open Gmail to confirm &gt; Enter your first and last name &gt; Enter phone number &gt; Enter a 6-digit confirmation code &gt; Complete.</p>\n<ul>\n<li><strong>Detailed instructions</strong></li>\n</ul>\n<p><strong>Step 1: </strong>Visit the website <a href=\"https://www.smspool.net/\" target=\"_blank\" rel=\"nofollow noopener\">https://www.smspool.net/ </a>to proceed to buy a virtual phone number.</p>\n<p><strong>Step 2: </strong>Select <strong>Log in </strong>to log in if you already have an account, if not, select <strong>Register </strong>and proceed to fill in all the information to register an account!</p>\n<p class=\"img\"><img class=\"lazy\" title=\"Visit SMSPool website\" src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot32-800x390.png\" alt=\"Visit SMSPool website\" width=\"800\" height=\"390\" data-src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot32-800x390.png\"></p>\n<p class=\"titleOfImages\">Visit SMSPool website</p>\n<p class=\"img\"><img class=\"lazy\" title=\"Fill in the account registration information\" src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot33-800x391.png\" alt=\"Fill in the account registration information\" width=\"800\" height=\"391\" data-src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot33-800x391.png\"></p>\n<p class=\"titleOfImages\">Fill in the account registration information</p>\n<p><strong>Step 3: </strong>Log in to your account.</p>\n<p class=\"img\"><img class=\"lazy\" title=\"Log in to your account\" src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot34-800x390.png\" alt=\"Log in to your account\" width=\"800\" height=\"390\" data-src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot34-800x390.png\"></p>\n<p class=\"titleOfImages\">Log in to your account</p>\n<p><strong>Step 4: </strong>Make a deposit to be able to rent a virtual phone number, first select the <strong>Deposit </strong>section. Next, select the <strong>Credit Card </strong>section.</p>\n<p class=\"img\"><img class=\"lazy\" title=\"Select Deposit section\" src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot35-800x391.png\" alt=\"Select Deposit section\" width=\"800\" height=\"391\" data-src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot35-800x391.png\"></p>\n<p class=\"titleOfImages\">Select Deposit section</p>\n<p class=\"img\"><img class=\"lazy\" title=\"Choose Credit Card payment method\" src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot36-800x391.png\" alt=\"Choose Credit Card payment method\" width=\"800\" height=\"391\" data-src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot36-800x391.png\"></p>\n<p class=\"titleOfImages\">Choose Credit Card payment method</p>\n<p><strong>Step 5: </strong>The cost you need to pay to rent a virtual phone number is <strong>$1</strong>. Enter the amount of $1 in the <strong>Amount </strong>section and select <strong>Deposit </strong>to make the payment.</p>\n<div class=\"infobox\">\n<p>Note: If your card is locked, expired or is paying in installments, it will not be accepted to make the payment process.</p>\n</div>\n<p class=\"img\"><img class=\"lazy\" title=\"Enter the amount of $1 in the Amount section and select Deposit to pay\" src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot37-800x390.png\" alt=\"Enter the amount of $1 in the Amount section and select Deposit to pay\" width=\"800\" height=\"390\" data-src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot37-800x390.png\"></p>\n<p class=\"titleOfImages\">Enter the amount of $1 in the Amount section and select Deposit to pay</p>\n<p class=\"img\"><img class=\"lazy\" title=\"Enter the information to pay\" src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot38-800x392.png\" alt=\"Enter the information to pay\" width=\"800\" height=\"392\" data-src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot38-800x392.png\"></p>\n<p class=\"titleOfImages\">Enter the information to pay</p>\n<p class=\"img\"><img class=\"lazy\" title=\"Enter the payment OTP code sent to the machine\" src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot40-800x391.png\" alt=\"Enter the payment OTP code sent to the machine\" width=\"800\" height=\"391\" data-src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot40-800x391.png\"></p>\n<p class=\"titleOfImages\">Enter the payment OTP code sent to the machine</p>\n<p class=\"img\"><img class=\"lazy\" title=\"Successful payment\" src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot41-800x389.png\" alt=\"Successful payment\" width=\"800\" height=\"389\" data-src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot41-800x389.png\"></p>\n<p class=\"titleOfImages\">Successful payment</p>\n<p><strong>Step 6</strong>: After completing the payment steps, you return to the main homepage by tapping the icon in the left corner of the screen. At the main interface, select <strong>Quick Order</strong>, continue at the search bar enter <strong>OpenAI / ChatGPT </strong>and select.</p>\n<p class=\"img\"><img class=\"lazy\" title=\"Press the icon back to the main interface\" src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot42-800x388.png\" alt=\"Press the icon back to the main interface\" width=\"800\" height=\"388\" data-src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot42-800x388.png\"></p>\n<p class=\"titleOfImages\">Press the icon back to the main interface</p>\n<p class=\"img\"><img class=\"lazy\" title=\"Choose Quick order\" src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot43-800x388.png\" alt=\"Choose Quick order\" width=\"800\" height=\"388\" data-src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot43-800x388.png\"></p>\n<p class=\"titleOfImages\">Choose Quick order</p>\n<p class=\"img\"><img class=\"lazy\" title=\"Search OpenAI / ChatGPT and select\" src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot44-800x388.png\" alt=\"Search OpenAI / ChatGPT and select\" width=\"800\" height=\"388\" data-src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot44-800x388.png\"></p>\n<p class=\"titleOfImages\">Search OpenAI / ChatGPT and select</p>\n<p><strong>Step 7</strong>: In the <strong>Pricing Option </strong>section, select <strong>Select highest success rate </strong>and select the country as <strong>United States</strong>. Scroll down and select <strong>Purchase </strong>to proceed with the payment to buy the phone number and complete.</p>\n<p class=\"img\"><img class=\"lazy\" title=\"Select Select highest success rate, the country is United States and Purchase\" src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot45-800x389.png\" alt=\"Select Select highest success rate, the country is United States and Purchase\" width=\"800\" height=\"389\" data-src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot45-800x389.png\"></p>\n<p class=\"titleOfImages\">Select Select highest success rate, the country is United States and Purchase</p>\n<p><strong>Step 8</strong>: Open <strong>Chrome browser </strong>on your computer. Go to the website <a href=\"https://chat.openai.com/chat\" target=\"_blank\" rel=\"nofollow noopener\">https://chat.openai.com/chat </a>and select <strong>Sign up</strong>.</p>\n<p class=\"img\"><img class=\"lazy\" title=\"Go to the ChatGPT website and select Sign up\" src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot18-800x425.png\" alt=\"Go to the ChatGPT website and select Sign up\" width=\"800\" height=\"425\" data-src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot18-800x425.png\"></p>\n<p class=\"titleOfImages\">Go to the ChatGPT website and select Sign up</p>\n<p><strong>Step 9</strong>: Enter <strong>the </strong>desired <strong>Email account </strong>and <strong>password</strong>, then select <strong>Continue</strong>.</p>\n<p class=\"img\"><img class=\"lazy\" title=\"Enter your Email account and password, then select Continue\" src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot19-800x424.png\" alt=\"Enter your Email account and password, then select Continue\" width=\"800\" height=\"424\" data-src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot19-800x424.png\"></p>\n<p class=\"titleOfImages\">Enter your Email account and password, then select Continue</p>\n<p><strong>Step 10</strong>: Check Email mailbox and verify account.</p>\n<p class=\"img\"><img class=\"lazy\" title=\"Account authentication\" src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot20-800x424.png\" alt=\"Account authentication\" width=\"800\" height=\"424\" data-src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot20-800x424.png\"></p>\n<p class=\"titleOfImages\">Account authentication</p>\n<p><strong>Step 11</strong>: At this time, the screen will display the words Not available..., right-click to select <strong>Inspect, </strong>then select the <strong>Application </strong>item and proceed to right-click to select <strong>Clear (Delete) </strong>items in <strong>Local Storage</strong>.</p>\n<p class=\"img\"><img class=\"lazy\" title=\"Right click to select Inspect\" src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot22-800x426.png\" alt=\"Right click to select Inspect\" width=\"800\" height=\"426\" data-src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot22-800x426.png\"></p>\n<p class=\"titleOfImages\">Right click to select Inspect</p>\n<p class=\"img\"><img class=\"lazy\" title=\"Select Application section\" src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot23-800x423.png\" alt=\"Select Application section\" width=\"800\" height=\"423\" data-src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot23-800x423.png\"></p>\n<p class=\"titleOfImages\">Select Application section</p>\n<p class=\"img\"><img class=\"lazy\" title=\"Right-click to select Clear items in Local Storage\" src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot24-800x425-1.png\" alt=\"Right-click to select Clear items in Local Storage\" width=\"800\" height=\"425\" data-src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot24-800x425-1.png\"></p>\n<p class=\"titleOfImages\">Right-click to select Clear items in Local Storage</p>\n<p><strong>Step 12</strong>: Next, select the link to the <strong>VPN Proxy VeePN </strong>utility (<a title=\"HERE\" href=\"https://chrome.google.com/webstore/detail/free-vpn-for-chrome-vpn-p/majdfhpaihoncoakbjgbdhglocklcgno?hl=vi\" target=\"_blank\" rel=\"nofollow noopener\">HERE</a>), click <strong>Add to Chrome </strong>to install the IP transcoding utility. Open the widget, select the country, and then log in again.</p>\n<p class=\"img\"><img class=\"lazy\" title=\"Add VeePN Proxy VPN utility to Chrome\" src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenchot21-800x450.jpg\" alt=\"Add VeePN Proxy VPN utility to Chrome\" width=\"800\" height=\"450\" data-src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenchot21-800x450.jpg\"></p>\n<p class=\"titleOfImages\">Add VeePN Proxy VPN utility to Chrome</p>\n<p class=\"img\"><img class=\"lazy\" title=\"Open VPN Proxy VeePN utility\" src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot21-800x426.png\" alt=\"Open VPN Proxy VeePN utility\" width=\"800\" height=\"426\" data-src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot21-800x426.png\"></p>\n<p class=\"titleOfImages\">Open VPN Proxy VeePN utility</p>\n<p><strong>Step 13</strong>: Enter <strong>your first and last name </strong>and click <strong>Continue </strong>to continue.</p>\n<p class=\"img\"><img class=\"lazy\" title=\"Enter your first and last name\" src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot25-800x391.png\" alt=\"Enter your first and last name\" width=\"800\" height=\"391\" data-src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot25-800x391.png\"></p>\n<p class=\"titleOfImages\">Enter your first and last name</p>\n<p><strong>Step 14</strong>: Go to the phone number entry, first return to the SMSPool website, in the section <strong>of Pending SMS </strong>will display a confirmation code with 6 numbers. Please copy this code through the registration page, so you have completed the ChatGPT account registration.</p>\n<p class=\"img\"><img class=\"lazy\" title=\"Copy code\" src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot46-800x533.jpg\" alt=\"Copy code\" width=\"800\" height=\"533\" data-src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot46-800x533.jpg\"></p>\n<p class=\"titleOfImages\">Copy code</p>\n<p class=\"img\"><img class=\"lazy\" title=\"Enter the code and complete the registration\" src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot31-800x388.png\" alt=\"Enter the code and complete the registration\" width=\"800\" height=\"388\" data-src=\"https://cdn.tgdd.vn//GameApp/1508709//Screenshot31-800x388.png\"></p>\n<p class=\"titleOfImages\">Enter the code and complete the registration</p>', '2023-03-22', 'http://res.cloudinary.com/dt2g4oabz/image/upload/v1679468364/ayt0rrdfdckhvy9ckkzw.jpg', NULL, 'GPT chat', 'What is GPT chat? How to register, install, use ChatGPT from A-Z in Vietnam', 1),
(6, '<h2><strong>What Emotions Can Music Make You Feel?</strong></h2>\n<p>Music can validate your current emotional state and influence your emotional destination. Again, the <a class=\"text-only\" href=\"https://doi.org/10.3390%2Fijerph182312486\">Iso-principle</a> can help us experience desired emotions. It works most effectively when we first find a song that matches our current feeling or mood. In music therapy, emotional regulation is frequently addressed. Music can elicit many, if not every, emotion. Knowing yourself and which music you pair with your emotions will improve self-regulation, &nbsp;or &ldquo;feeling your feelings.&rdquo;&nbsp;</p>\n<p>Music and emotions are personal, cultural and associated with prior experiences. A song will not give everybody the same feeling. That is the beauty of the diversity in music and preference across <a class=\"text-only\" name=\"_Int_A5W5bH1g\"></a>diverse cultures and time periods. <a class=\"text-only\" href=\"https://musicscience.net/cross-cultural-research-in-music-and-emotions/\">Research</a> attributes this phenomenon to the messages our cultures and experiences have assigned to sounds before listening to a song<a class=\"text-only\" name=\"_Int_VaSVw5Uo\"></a>.</p>\n<p>While culture, memories and associations influence music and emotions, Berkley found an overlap across cultures and compiled an interactive music map based on people&rsquo;s responses with 13 emotional dimensions that people in China and the United States self-reported. You can check <a class=\"text-only\" href=\"https://www.ocf.berkeley.edu/~acowen/music.html\">Berkley&rsquo;s Interactive Music Map</a> to find out what music makes you feel.</p>\n<h2><strong>What Impact Does Music Have on Memory?</strong></h2>\n<p>Music can help retain <a class=\"text-only\" name=\"_Int_UCC7xEHG\"></a>essential information despite memory loss. <a class=\"text-only\" name=\"_Int_pyeUySW8\"></a><a class=\"text-only\" href=\"https://www.medicaldaily.com/scientists-confirm-memories-music-are-stored-different-part-brain-other-memories-242104\">Music memory</a> is stored in the hippocampus, centrally located in the brain. Therefore, music memories are less likely to be negatively impacted by age or disease<a class=\"text-only\" name=\"_Int_btVBmIcr\"></a>.</p>\n<p>A <a class=\"text-only\" href=\"https://psychcentral.com/lib/memory-and-mnemonic-devices\">musical mnemonic</a> device is a natural way to memorize and recall information. As children, we learn various academic and social concepts through songs. Similarly, these memory strategies are highly effective for adults. In fact, our brains automatically &ldquo;<a class=\"text-only\" href=\"https://www.sciencedaily.com/releases/2005/04/050425202958.htm\">fill in the gaps</a>&rdquo; <a class=\"text-only\" name=\"_Int_Q5WZBIk7\"></a>when a song suddenly stops<a class=\"text-only\" name=\"_Int_2bkM0OH8\"></a>.</p>\n<p>Music therapists often incorporate these techniques with individuals to improve <a class=\"text-only\" href=\"https://www.musictherapy.org/assets/1/7/FactSheet_Music_Therapy_and_Dementia_Care_2021.pdf\">memory retention</a> or <a class=\"text-only\" href=\"https://www.musictherapy.org/assets/1/7/FactSheet_Music_Therapy_in_Special_Education_2021.pdf\">developmental learning</a> goals. Music may activate memories and remind us of places, events or people. A familiar tune may elicit the emotions associated with those memories.</p>\n<h2><strong>What Changes Does Music Have on Your Body?</strong></h2>\n<p>Singing, playing instruments and even dancing can improve pain tolerance. <a class=\"text-only\" href=\"https://doi.org/10.1177/147470491201000403\">Researchers</a> found that the physical movement used to create music provides a synchronized activity that significantly heightens the pain threshold. Music therapists are specifically trained clinicians that use music to address goals such as <a class=\"text-only\" href=\"https://www.musictherapy.org/assets/1/7/FactSheet_Music_Therapy_for_Pain_Management_2021_4-22update.pdf\">pain reduction</a><a class=\"text-only\" name=\"_Int_kvY5RZPw\"></a><a class=\"text-only\" name=\"_Int_pRMGSr4r\"></a>.</p>\n<p>Because music is often an enjoyable activity, it can activate the release of endorphins, which creates a <a class=\"text-only\" href=\"https://my.clevelandclinic.org/health/body/23040-endorphins\">general feeling of well-being</a>. Music therapy can successfully reduce post-operative pain, physical tension and influence heart and breathing rates. Fast music tends to <a class=\"text-only\" href=\"https://www.msjonline.org/index.php/ijrms/article/view/3734\">increase pulse rate</a> and <a class=\"text-only\" href=\"https://www.msjonline.org/index.php/ijrms/article/view/3734\">blood pressure</a>. Slow music tends to decrease pulse rate and blood pressure, as well as <a class=\"text-only\" href=\"https://academic.oup.com/eurheartj/article/36/44/3043/2293535\">breathing rate</a>.</p>\n<h2><strong>How Does Music Affect Behavior<a class=\"text-only\" name=\"_Int_y7fPS2yS\"></a>? </strong></h2>\n<p>Music can affect behavior by being a motivator, a timer for completing tasks or a mood enhancer. It may also impact our shopping habits<a class=\"text-only\" name=\"_Int_zExx0CyO\"></a>.</p>\n<p>Music is used in advertising to encourage brand recognition and create familiarity and positive association with various products.</p>\n<p>Younger shoppers spend more time shopping when stores play instrumental music. Older shoppers spend more time shopping when there&rsquo;s music playing with lyrics. Baby boomers are likely to spend more money if classic rock is playing in a store. Generations older than baby boomers are less likely to spend money if any music is playing<a class=\"text-only\" name=\"_Int_BzNBmlb0\"></a>.</p>\n<p>If you are buying wine for the holidays, be aware that <a class=\"text-only\" href=\"https://www.acrwebsite.org/volumes/7467/volumes/v20/NA-20/\">classical music</a> may make you feel comfortable spending a little more money than those top 40 hits<a class=\"text-only\" name=\"_Int_6shjdY5H\"></a>.</p>\n<p>Store associates are another group of people who are highly influenced by music. <a class=\"text-only\" href=\"https://www.tandfonline.com/doi/abs/10.1362/0267257022775891\">People who work in retail</a> are more likely to engage with customers and be in a positive mood if they <a class=\"text-only\" name=\"_Int_YDy5L15W\"></a>don&rsquo;t have to listen to the same music all day<a class=\"text-only\" name=\"_Int_j39y7zJq\"></a>.</p>\n<h2><strong>Why Do We Enjoy Holiday Music?</strong></h2>\n<p>Holiday music is a vehicle that communicates sacred and secular stories of the season. People may enjoy holiday music because pivotal cultural and traditional events are often intertwined. Music fosters community, remembrance and celebrations.</p>\n<p>Known as the <a class=\"text-only\" href=\"https://www.proquest.com/docview/2616339132?pq-origsite=primo&amp;accountid=4840\">Festival of Lights,</a> Hanukkah is often associated with music and dancing. Starting at nightfall in Jerusalem, you are likely to hear people singing &ldquo;<a class=\"text-only\" href=\"https://www.youtube.com/watch?v=4MRS5c7TbJw\">Ma&rsquo;oz Tzur</a><a class=\"text-only\" name=\"_Int_KR25gJEz\"></a>.&rdquo; In some families, singing songs while lighting the menorah candles is part of their valued traditions.</p>\n<p>Christmas music can be associated with sacred or secular aspects of people&rsquo;s lives. People decorate houses <a class=\"text-only\" href=\"https://www.youtube.com/watch?v=GufRiBUZQPc&amp;t=58s\">combining lights with music</a>. Families drive down streets playing Christmas music to create memories with their children. <a class=\"text-only\" href=\"https://www.youtube.com/watch?v=rU7BCH9i-oY\">Caroling</a> in neighborhoods, or a similar tradition called <a class=\"text-only\" href=\"https://www.youtube.com/watch?v=8VPOrUhU52c\">Parrandas</a> in Puerto Rico, includes singing to and with your communities using traditional music and instruments.</p>\n<p>Falling directly after Christmas, <a class=\"text-only\" href=\"https://www.interexchange.org/articles/career-training-usa/history-principles-and-symbols-of-kwanzaa/\">Kwanzaa</a> is a non-religious and non-political holiday originated to bring Black Americans together. Music in Kwanza includes storytelling, dancing, drumming and <a class=\"text-only\" href=\"https://www.songsforteaching.com/kwanzaasongs/\">singing</a>. Established in 1966, the holiday commemorates the African heritage of many Black Americans&rsquo; history, culture and traditions<a class=\"text-only\" name=\"_Int_o8AsDBtV\"></a>.</p>\n<p>While many people have fond memories and traditions with holiday music, it is important to be mindful. Some people have equally painful memories associated with holiday music or songs.</p>', '2023-03-22', 'http://res.cloudinary.com/dt2g4oabz/image/upload/v1679468549/qk6rv85smvonw6hx0snh.jpg', NULL, 'Music Affects', ' How Music Affects Your Mind, Mood and Body', 8),
(7, '<h3 id=\"1-use-quickline-for-straight-continuous-lines\">1. Use Quickline for Straight, Continuous Lines</h3>\n<figure class=\"kg-card kg-image-card\"><img class=\"kg-image\" src=\"https://d1ng1bucl7w66k.cloudfront.net/ghost-blog/2022/08/Screen-Shot-2022-08-04-at-10.32.26-AM.png\" alt=\"Use quickline in Procreate\" width=\"754\" height=\"1080\" loading=\"lazy\"></figure>\n<p>This tool is so helpful to people who have difficulties drawing straight lines. Simply draw a line, curve or circle and hold your Apple pencil on the screen once you are done. The app will then perfect or &ldquo;stabilize&rdquo; the lines you have drawn.</p>\n<h3 id=\"2-use-layers\">2. Use Layers</h3>\n<figure class=\"kg-card kg-image-card\"><img class=\"kg-image\" src=\"https://d1ng1bucl7w66k.cloudfront.net/ghost-blog/2022/08/Screen-Shot-2022-08-04-at-10.32.50-AM.png\" alt=\"Use layers in Procreate\" width=\"764\" height=\"1070\" loading=\"lazy\"></figure>\n<p>Layers can add a level of professionalism to your art and can help you stay organized by being able to edit certain details later without it impacting every part of your artwork. To add a layer press the &ldquo;+&rdquo; sign right next to the layers panel. You can also access other options for a layer such as delete, lock and duplicate by swiping left on the layer you want to manipulate.</p>\n<h3 id=\"3-use-blend-modes\">3. Use Blend Modes</h3>\n<figure class=\"kg-card kg-image-card\"><img class=\"kg-image\" src=\"https://d1ng1bucl7w66k.cloudfront.net/ghost-blog/2022/08/Screen-Shot-2022-08-04-at-10.33.14-AM.png\" alt=\"Use blend modes\" width=\"754\" height=\"1084\" loading=\"lazy\"></figure>\n<p>There are tools within each layer that you can use so the different shapes, objects, and textures on each layer can interact with each other in different ways. We call these blend modes. In each layer, you can access blend modes by pressing the &ldquo;n&rdquo;. &ldquo;N&rdquo; or normal mode is the default blend mode for all layers. You will then see different blending modes such as darken, lighten, control layer opacity and much more. Clicking on them will show a preview of how the layer will interact under that new mode.</p>\n<h3 id=\"4-take-advantage-of-alpha-lock\">4. Take Advantage of Alpha Lock</h3>\n<figure class=\"kg-card kg-image-card\"><img class=\"kg-image\" src=\"https://d1ng1bucl7w66k.cloudfront.net/ghost-blog/2022/08/Screen-Shot-2022-08-04-at-10.33.33-AM.png\" alt=\"Use Alpha lock\" width=\"774\" height=\"1084\" loading=\"lazy\"></figure>\n<p>This option is helpful when you want to draw shadows, highlights, and patterns without coloring outside the lines already drawn. Once you have drawn on a layer, tap on the image of the layer you would like to add more details to and select &ldquo;alpha lock&rdquo; on the layer. Once &ldquo;locked&rdquo; any details you add will stay within the boundaries of your original image.</p>\n<h3 id=\"5-try-clipping-masks\">5. Try Clipping Masks</h3>\n<figure class=\"kg-card kg-image-card\"><img class=\"kg-image\" src=\"https://d1ng1bucl7w66k.cloudfront.net/ghost-blog/2022/08/Screen-Shot-2022-08-04-at-10.33.53-AM.png\" alt=\"Try clipping masks\" width=\"764\" height=\"1084\" loading=\"lazy\"></figure>\n<p>Clipping masks are like an alpha lock but with some key differences. First off, you will be on a new layer! So you will not be impacting your original layer. Add a new layer on top of the layer you want to work on. Select the new layer by tapping on its image and select &ldquo;clipping mask&rdquo;. This will &ldquo;mask&rdquo; the below image. All new details will be added in the boundaries of the shape below.</p>', '2023-03-22', 'http://res.cloudinary.com/dt2g4oabz/image/upload/v1679468714/jipurmupwyyz8k09bq7w.jpg', NULL, ' Procreate Tips', '15 Procreate Tips and Tricks For Beginners', 22),
(10, '<article>\n<h2 id=\"why_is_time_management_important_for_students\">Why is Time Management Important for Students?</h2>\n<p>Time management for students (and everyone else) is about making your day purposeful. It is about taking control of the time you have and optimizing it for focus,&nbsp;<a title=\"productivity\" href=\"https://www.simplilearn.com/what-is-productivity-and-how-to-define-and-measure-it-article\" target=\"_blank\" rel=\"noopener\">productivity</a>, and above all, balance. Before we list out the time management tips for students, it is crucial for students to understand why time management is important.</p>\n<p>All of us should make the most of the limited amount of time we have in a day. It is very easy to get wrapped up in a fury of various activities and accomplish less. Managing time effectively enables students to become more confident, and organized, and learn more efficiently.&nbsp;<a title=\"Effective time management skills\" href=\"https://www.simplilearn.com/time-management-skills-article\" target=\"_blank\" rel=\"noopener\">Effective time management skills&nbsp;</a>are particularly essential for high school students, as they have to deal with more subjects, tests, assignments, and extracurriculars. Time management techniques can help students be on track and cope with the stress of added responsibilities.&nbsp;</p>\n<p>Following are a few more reasons why time management is important for students:</p>\n<h3>Enables You to Accomplish Your Goals Faster</h3>\n<p>Appropriate time management makes one more effective and encourages you to give your best to what you are doing and what you can, thus&nbsp;<a title=\"helping you achieve your goals\" href=\"https://www.simplilearn.com/time-management-skills-to-achieve-career-goals-article\" target=\"_blank\" rel=\"noopener\">helping you achieve your goals</a>&nbsp;much faster.</p>\n<h3>Enables You to Prioritize Your Work</h3>\n<p>When creating a timetable, you prioritize and arrange essential tasks that need immediate attention. For example, students have to complete assignments before attending a session. A student can fit in time to work on the assignments before attending a study group with correct time management.</p>\n<h3>Enables You to Get More Done in Less Time</h3>\n<p>Dedicating a specified amount of time to a particular task helps you focus on it. Instead of working on a given task with no predefined time assigned, you can complete the same task by sticking to a time plan. Without a time plan, you might completely forget to finish a task.</p>\n<h3>Reduces Stress Levels&nbsp;</h3>\n<p><a title=\"Time management skills\" href=\"https://www.simplilearn.com/time-management-skills-article\" target=\"_blank\" rel=\"noopener\">Time management skills</a>&nbsp;can help you prioritize the time required for essential tasks; prioritizing tasks and having enough time to accomplish those tasks means reduced stress levels.</p>\n<h3>Helps You Become More Efficient</h3>\n<p>Effective time management helps you to be more focused at school/college/university, thus increasing your efficiency and enabling you to accomplish more within less time.</p>\n<p>So, how can students learn to manage time more effectively? We have collated a list of the best time management tips for students to beat procrastination, stay focused, and be more productive.</p>\n</article>\n<article>\n<h2 id=\"time_management_tips_and_strategies\">Time Management Tips and Strategies</h2>\n<p>Efficient time management is one of the primary keys to success, and thus, it is worth learning. Following are&nbsp;<a title=\"time management strategies\" href=\"https://www.simplilearn.com/effective-time-management-tips-article\" target=\"_blank\" rel=\"noopener\">time management strategies</a>&nbsp;for students to help them manage their time in the best possible manner.</p>\n<h3>Make Use of a Daily Schedule Template to Plan Your Day</h3>\n<p>Seminars, classes, and workshops may take up a chunk of your day, but how one schedules their own time makes all the difference. It is essential to master your schedule. A daily schedule template helps you manage and control your time each day. It will enable you to stay organized and focus on what matters most and even help you overcome procrastination. The method that most successful people from Elon Musk to Bill Gates use is &ldquo;time blocking&rdquo;. Time blocking is creating a template for how you intend to spend every minute of your day. Students should therefore follow this method to manage their time more fruitfully.</p>\n<h3>Understand How You are Currently Spending Your Time (And Where You Are Losing It)</h3>\n<p>Your schedule will offer you an ideal version of your day, but you need to analyze how you spend your time to develop better time management habits. Without understanding how you are spending your time each day, it is impossible to build better time management strategies for students to stay focused.</p>\n<h3>Set Proper Goals to Measure Your Progress</h3>\n<p>Goals are an excellent way to get you motivated to do school work. However, the problem is that goals are just the result, with you not knowing how to achieve them. So, focus on what needs to be done to achieve that goal by focusing on constant progress and developing better habits. For example, if you need to write a 5,000-word essay in a month, set a daily goal of writing 500 words. If you continue this, you can complete your essay in a week.</p>\n<h3>Break Large Projects Into Smaller, Actionable Tasks</h3>\n<p>A part of proper&nbsp;<a title=\"goal-setting\" href=\"https://www.simplilearn.com/smart-goals-examples-article\" target=\"_blank\" rel=\"noopener\">goal-setting</a>&nbsp;is to segregate large goals from smaller daily tasks. Doing this will help you stay focused and stop you from procrastinating. It is easy to procrastinate when a project feels like a huge task. However, taking that first step is all you need to build momentum.</p>\n</article>', '2023-04-28', 'http://res.cloudinary.com/dmhjrwkme/image/upload/v1682676165/fokje02wzpqdj42lejea.jpg', NULL, 'Proven Time Management Tips', 'Proven Time Management Tips and Strategies for Students', 0);

=======
  `content` varchar(255) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `image_banner` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

>>>>>>> origin/main
-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chatting`
--

CREATE TABLE `chatting` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `type_file` int(11) DEFAULT NULL,
  `receiver` bigint(20) DEFAULT NULL,
  `sender` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

<<<<<<< HEAD
--
-- Đang đổ dữ liệu cho bảng `chatting`
--

INSERT INTO `chatting` (`id`, `content`, `created_date`, `file_name`, `type_file`, `receiver`, `sender`) VALUES
(1, 'hi', '2023-03-22 14:07:30', NULL, 0, 1, 4),
(2, 'hi', '2023-03-22 18:36:02', NULL, 0, 5, 5),
(3, 'hi', '2023-03-22 18:36:31', NULL, 0, 3, 5),
(4, 'hi', '2023-03-22 18:36:53', NULL, 0, 5, 4),
(5, 'how are you', '2023-03-22 18:37:11', NULL, 0, 4, 5),
(6, 'hi', '2023-04-03 20:07:20', NULL, 0, 5, 4),
(7, 'http://res.cloudinary.com/dt2g4oabz/image/upload/v1682417486/fewtig47ec2ybsqtrpgi.pdf', '2023-04-25 17:11:26', 'Finding Tutor Online System.pdf', 1, 4, 5),
(8, 'http://res.cloudinary.com/dmhjrwkme/image/upload/v1682423676/ulwbopixh9i5ua3iupck.pdf', '2023-04-25 18:54:36', 'Duong Khanh Ngoc (FGW CT)_351440_0.pdf', 1, 4, 5),
(9, 'hi', '2023-04-27 21:45:10', NULL, 0, 8, 20),
(10, 'Can you send me ID paypal to pay the course', '2023-04-27 21:45:55', NULL, 0, 20, 8),
(11, 'my paypal: @dominic11', '2023-04-27 21:46:54', NULL, 0, 8, 20),
(12, 'wait a minutes', '2023-04-27 21:47:10', NULL, 0, 20, 8),
(13, 'http://res.cloudinary.com/dmhjrwkme/image/upload/v1682606927/mu80o0id8jaynet7yol3.png', '2023-04-27 21:48:48', 'IMG_6965.PNG', 1, 8, 20),
(14, 'Thank you, I approve for you right now', '2023-04-27 21:49:31', NULL, 0, 8, 20),
(15, 'hi', '2023-04-28 01:05:33', NULL, 0, 4, 8);

=======
>>>>>>> origin/main
-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

<<<<<<< HEAD
--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`id`, `content`, `created_date`, `course_id`, `user_id`) VALUES
(2, 'Good', '2023-03-28', 1, 5),
(3, 'Hi', '2023-03-29', 3, 5),
(28, 'Can I help you?', '2023-04-19', 3, 4),
(29, 'Good', '2023-04-19', 2, 4),
(31, 'cksks', '2023-04-19', 2, 5),
(32, 'Good', '2023-04-28', 3, 8);

=======
>>>>>>> origin/main
-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `course`
--

CREATE TABLE `course` (
  `id` bigint(20) NOT NULL,
  `actived` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
<<<<<<< HEAD
  `description` mediumtext DEFAULT NULL,
=======
  `description` varchar(255) DEFAULT NULL,
>>>>>>> origin/main
  `end_date` date DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `feed_back_by_admin` varchar(255) DEFAULT NULL,
  `image_banner` varchar(255) DEFAULT NULL,
  `max_quantity` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `major_id` bigint(20) DEFAULT NULL,
<<<<<<< HEAD
  `user_id` bigint(20) DEFAULT NULL,
  `linkmeet` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `course`
--

INSERT INTO `course` (`id`, `actived`, `created_date`, `deleted`, `description`, `end_date`, `end_time`, `feed_back_by_admin`, `image_banner`, `max_quantity`, `name`, `price`, `start_date`, `start_time`, `major_id`, `user_id`, `linkmeet`) VALUES
(1, 1, '2023-03-22', 1, '<h2 class=\"ud-heading-xl styles--description__header--2Z7Vb\" data-purpose=\"description-title\">Description</h2>\n<div class=\"show-more-module--container--2QPRN\">\n<div class=\"show-more-module--content--cjTh0 show-more-module--with-gradient--1ZDrA\">\n<div tabindex=\"0\">\n<div data-purpose=\"safely-set-inner-html:description:description\">\n<p><strong>NEW PYTHON CODE&nbsp;</strong></p>\n<p>This python for beginners course is geared to students who want to know how python works and also to those totally new to programming.</p>\n<p>The python language has very simple syntax(way to write it) to learn and it is one of the most powerful languages to learn since it can used for a variety of things.</p>\n<p><strong>Here are some:</strong></p>\n<ol>\n<li>Data analysis</li>\n<li>Game development</li>\n<li>Visualization</li>\n<li>Web development</li>\n<li>Robotics</li>\n<li>and more....</li>\n</ol>\n<p>&nbsp;</p>\n<p>Jobs in this field are really lucrative and knowing this language will give you an edge when finding a job and making a lot more money than other developers; python developers are not as many as in other languages since people think is hard. Python is super easy to learn but very powerful since it contains many possibilities.</p>\n<p>Python is growing faster and faster everyday and it has surpassed many other languages over the years for a lot of reasons, which you will find out soon enough.</p>\n<p>------------------------------------------------------------------------------</p>\n<p><strong>Why take this course?</strong></p>\n<p>This course starts with explaining what programming really is? Have you ever wondered how things actually work in a program?</p>\n<p>1.&nbsp;<strong>Teaches the foundation of GENERAL programming</strong></p>\n<p>Every student should have some foundations on what programming really is before learning any language, why? Because once you understand the core components of programming it will be a lot easier to learn any language and create better programs.</p>\n<p>2.&nbsp;<strong>New lectures added all the time</strong></p>\n<p>When you like what you do, it reflects. This is not a job for me, so I wake up wanting to code and help my students. Basically you pay once, get the course forever and get extra values added all the time, you have to love that :)</p>\n<p>3.<strong>&nbsp;Fun place to be</strong></p>\n<p>I love making my lectures fun and engaging, so no boring lectures here!</p>\n<p>4.&nbsp;<strong>T</strong><strong>he support you get in this course in unmatched</strong></p>\n<p>have you ever joined a class and received very little support or none at all? Well that is not going to happen in this class, because I love helping my students.</p>\n<p>&nbsp;</p>\n</div>\n<div class=\"styles--audience--2xuzW\" data-purpose=\"target-audience\">\n<h2 class=\"ud-heading-xl styles--audience__title--1qhlO\">Who this course is for:</h2>\n<ul class=\"styles--audience__list--16EaN\">\n<li>Student totally new to programming</li>\n<li>Student totally new to python</li>\n</ul>\n</div>\n</div>\n</div>\n</div>', '2022-12-24', '11:00:00', 's', 'http://res.cloudinary.com/dt2g4oabz/image/upload/v1679473784/df7ijz21gdk8l0abd2tl.jpg', 50, 'Python for Beginners - Learn Programming from scratch', 35, '2022-11-28', '09:30:00', 5, 4, 'https://meet.google.com/fcu-qdsy-pkx'),
(2, 1, '2023-03-22', 0, '<p>hi</p>', '2023-05-26', '12:00:00', NULL, 'http://res.cloudinary.com/dmhjrwkme/image/upload/v1682614302/j4eusdylfuxl41f6yjda.jpg', 1, 'Java Spring Boot', 55, '2023-05-01', '10:30:00', 1, 4, 'https://meet.google.com/huw-deua-jhd'),
(3, 0, '2023-03-29', 0, '<h2 class=\"ud-heading-xl what-you-will-learn--title--2ztwE\">What you\'ll learn</h2>\n<div class=\"what-you-will-learn--content-spacing--3n5NU show-more-module--container--2QPRN\">\n<div class=\"show-more-module--content--cjTh0 show-more-module--with-gradient--1ZDrA\">\n<div tabindex=\"0\">\n<ul class=\"ud-unstyled-list ud-block-list what-you-will-learn--objectives-list--eiLce what-you-will-learn--objectives-list-two-column-layout--rZLJy\">\n<li>\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\n<div class=\"ud-block-list-item-content\">You will have intermediate to expert level knowledge of graphic design theory that you will immediately be able to apply to your career, job, hobby, or company.</div>\n</div>\n</li>\n<li>\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\n<div class=\"ud-block-list-item-content\">You will be given a major overview of the most common graphic design practices and the thought process behind these principles.</div>\n</div>\n</li>\n<li>\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\n<div class=\"ud-block-list-item-content\">You will be given real-world, applicable projects that you can follow along with and practice.</div>\n</div>\n</li>\n<li>\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\n<div class=\"ud-block-list-item-content\">You will achieve the experience and knowledge to take graphic design fundamentals and apply them in your everyday life.</div>\n</div>\n</li>\n<li>\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\n<div class=\"ud-block-list-item-content\">You will learn color theory and how it applies to the world around us, from products and art to branding and advertising.</div>\n</div>\n</li>\n<li>\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\n<div class=\"ud-block-list-item-content\">You will learn typography theory and how type plays a major role in both print mediums and digital media.</div>\n</div>\n</li>\n<li>\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\n<div class=\"ud-block-list-item-content\">You will learn photography composition and how it interacts with graphic design elements to create stunning looking artwork.</div>\n</div>\n</li>\n<li>\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\n<div class=\"ud-block-list-item-content\">You will learn layout, user interface and experience design, and composition to understand how to control what you want the viewer to see.</div>\n</div>\n</li>\n<li>\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\n<div class=\"ud-block-list-item-content\">You will learn about logo design and branding, and the way that you or your company can use these ideas to get in the eyes of more people.</div>\n</div>\n</li>\n<li>\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\n<div class=\"ud-block-list-item-content\">You will learn about past and current design trends that you can use as a source for creating your own original work.</div>\n</div>\n</li>\n<li>\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\n<div class=\"ud-block-list-item-content\">You will learn about the legal side of design and how you can take safe measures to make sure you are following the proper laws of copyright and trademarks.</div>\n</div>\n</li>\n<li>\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\n<div class=\"ud-block-list-item-content\">Learn the Step-By-Step process to becoming a graphic designer</div>\n</div>\n</li>\n<li>\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\n<div class=\"ud-block-list-item-content\">NEW! Learn some 2021 design trends to look out for with three new student projects</div>\n</div>\n</li>\n</ul>\n</div>\n</div>\n</div>', '2023-04-29', '10:50:00', NULL, 'http://res.cloudinary.com/dmhjrwkme/image/upload/v1682615048/a9nmcrrgcyv1cpcw7wtk.jpg', 20, 'The Complete Graphic Design Theory for Beginners Course', 99, '2023-03-29', '09:20:00', 1, 4, 'https://meet.google.com/huw-deua-jhd'),
(9, 1, '2023-04-27', 0, NULL, '2023-05-25', '12:00:00', NULL, 'http://res.cloudinary.com/dmhjrwkme/image/upload/v1682591358/xomuqpnml32w1lbeytex.jpg', 1, 'ReactJS for Beginners 2020', 20, '2023-04-28', '10:30:00', 5, 17, 'https://meet.google.com/udj-jtnu-uob'),
(10, 1, '2023-04-27', 0, NULL, '2023-06-30', '10:30:00', NULL, 'http://res.cloudinary.com/dmhjrwkme/image/upload/v1682591620/qqad6yw1v8vurvixesy4.jpg', 1, 'The Complete Graphic Design Theory for Beginners Course', 4, '2023-05-27', '09:00:00', 8, 16, 'https://meet.google.com/udj-jtnu-uob'),
(11, 1, '2023-04-27', 1, NULL, '2023-06-30', '10:30:00', 'The course is exist', 'http://res.cloudinary.com/dmhjrwkme/image/upload/v1682591622/czwhvfkewtbuzwj000uo.jpg', 1, 'The Complete Graphic Design Theory for Beginners Course', 4, '2023-05-27', '09:00:00', 8, 16, 'https://meet.google.com/udj-jtnu-uob'),
(24, 0, '2023-04-28', 1, '<div class=\"component-margin\">\n<h2 class=\"ud-heading-xl requirements--title--2wsPe\" data-purpose=\"requirements-title\">Requirements</h2>\n<ul class=\"ud-unstyled-list ud-block-list\">\n<li>\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\">\n<div class=\"ud-block-list-item-content\">Just some high school mathematics level.</div>\n</div>\n</li>\n</ul>\n</div>\n<div class=\"ud-text-sm component-margin styles--description--33-vq\" data-purpose=\"course-description\">\n<h2 class=\"ud-heading-xl styles--description__header--2Z7Vb\" data-purpose=\"description-title\">Description</h2>\n<div class=\"show-more-module--container--2QPRN\">\n<div class=\"show-more-module--content--cjTh0 show-more-module--with-gradient--1ZDrA\">\n<div tabindex=\"0\">\n<div data-purpose=\"safely-set-inner-html:description:description\">\n<p>Interested in the field of Machine Learning?&nbsp;Then this course is for you!</p>\n<p>This course has been designed by a&nbsp;<strong>Data Scientist and a Machine Learning expert</strong>&nbsp;so that we can share our knowledge and help you learn complex theory,&nbsp;algorithms, and coding libraries in a simple way.</p>\n<p><strong>Over 900,000 students</strong>&nbsp;world-wide trust this course.</p>\n<p>We will walk you step-by-step into the World of Machine Learning. With every tutorial, you will develop new skills and improve your understanding of this challenging yet lucrative sub-field of Data Science.</p>\n<p>This course can be completed by either doing either the&nbsp;<strong>Python tutorials, or R tutorials,</strong>&nbsp;or both -&nbsp;Python &amp;&nbsp;R. Pick the programming language that you need for your career.</p>\n<p>This course is&nbsp;fun and exciting, and at the same time, we dive deep into Machine Learning. It is structured the following way:</p>\n<ul>\n<li>\n<p>Part 1 - Data Preprocessing</p>\n</li>\n<li>\n<p>Part 2 - Regression: Simple Linear Regression, Multiple Linear Regression,&nbsp;Polynomial&nbsp;Regression,&nbsp;SVR, Decision Tree Regression,&nbsp;Random Forest Regression</p>\n</li>\n<li>\n<p>Part 3 - Classification: Logistic Regression, K-NN, SVM, Kernel SVM, Naive Bayes, Decision Tree Classification,&nbsp;Random&nbsp;Forest Classification</p>\n</li>\n<li>\n<p>Part 4 - Clustering: K-Means,&nbsp;Hierarchical Clustering</p>\n</li>\n<li>\n<p>Part 5 - Association Rule Learning: Apriori,&nbsp;Eclat</p>\n</li>\n<li>\n<p>Part 6 - Reinforcement Learning:&nbsp;Upper Confidence Bound,&nbsp;Thompson Sampling</p>\n</li>\n<li>\n<p>Part 7 - Natural Language Processing: Bag-of-words model&nbsp;and&nbsp;algorithms for NLP</p>\n</li>\n<li>\n<p>Part 8 - Deep Learning: Artificial Neural Networks,&nbsp;Convolutional Neural Networks</p>\n</li>\n<li>\n<p>Part 9 - Dimensionality Reduction: PCA, LDA, Kernel PCA</p>\n</li>\n<li>\n<p>Part 10 - Model Selection &amp; Boosting: k-fold Cross Validation, Parameter Tuning, Grid Search,&nbsp;XGBoost</p>\n</li>\n</ul>\n<p>Each section inside each part is independent. So you can either take the whole course from start to finish or you can jump right into any specific section and&nbsp;<strong>learn what you need for your career right now</strong>.</p>\n<p>Moreover, the course is packed with practical exercises that are based on&nbsp;<strong>real-life&nbsp;case studies</strong>. So not only will you learn the theory, but you will also get lots of&nbsp;<strong>hands-on practice</strong>&nbsp;building your own models.</p>\n<p>And as a bonus, this course&nbsp;<strong>includes both&nbsp;Python and R&nbsp;code templates&nbsp;</strong>which you can download and use on your own projects.</p>\n</div>\n<div class=\"styles--audience--2xuzW\" data-purpose=\"target-audience\">\n<h2 class=\"ud-heading-xl styles--audience__title--1qhlO\">Who this course is for:</h2>\n<ul class=\"styles--audience__list--16EaN\">\n<li>Anyone interested in Machine Learning.</li>\n<li>Students who have at least high school knowledge in math and who want to start learning Machine Learning.</li>\n<li>Any intermediate level people who know the basics of machine learning, including the classical algorithms like linear regression or logistic regression, but who want to learn more about it and explore all the different fields of Machine Learning.</li>\n<li>Any people who are not that comfortable with coding but who are interested in Machine Learning and want to apply it easily on datasets.</li>\n<li>Any students in college who want to start a career in Data Science.</li>\n<li>Any data analysts who want to level up in Machine Learning.</li>\n<li>Any people who are not satisfied with their job and who want to become a Data Scientist.</li>\n<li>Any people who want to create added value to their business by using powerful Machine Learning tools.</li>\n</ul>\n</div>\n</div>\n</div>\n</div>\n</div>', '2023-04-21', '12:00:00', 'This course is the same orther teacher', 'http://res.cloudinary.com/dmhjrwkme/image/upload/v1682619461/j76wn92xyum1ct3rspwo.jpg', 1, 'Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]', 3, '2023-04-14', '10:30:00', 5, 15, 'https://meet.google.com/agf-ndyt-ijz'),
(25, 1, '2023-04-28', 0, '<div class=\"component-margin\">\n<h2 class=\"ud-heading-xl requirements--title--2wsPe\" data-purpose=\"requirements-title\">Requirements</h2>\n<ul class=\"ud-unstyled-list ud-block-list\">\n<li>\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\">\n<div class=\"ud-block-list-item-content\">Just some high school mathematics level.</div>\n</div>\n</li>\n</ul>\n</div>\n<div class=\"ud-text-sm component-margin styles--description--33-vq\" data-purpose=\"course-description\">\n<h2 class=\"ud-heading-xl styles--description__header--2Z7Vb\" data-purpose=\"description-title\">Description</h2>\n<div class=\"show-more-module--container--2QPRN\">\n<div class=\"show-more-module--content--cjTh0 show-more-module--with-gradient--1ZDrA\">\n<div tabindex=\"0\">\n<div data-purpose=\"safely-set-inner-html:description:description\">\n<p>Interested in the field of Machine Learning?&nbsp;Then this course is for you!</p>\n<p>This course has been designed by a&nbsp;<strong>Data Scientist and a Machine Learning expert</strong>&nbsp;so that we can share our knowledge and help you learn complex theory,&nbsp;algorithms, and coding libraries in a simple way.</p>\n<p><strong>Over 900,000 students</strong>&nbsp;world-wide trust this course.</p>\n<p>We will walk you step-by-step into the World of Machine Learning. With every tutorial, you will develop new skills and improve your understanding of this challenging yet lucrative sub-field of Data Science.</p>\n<p>This course can be completed by either doing either the&nbsp;<strong>Python tutorials, or R tutorials,</strong>&nbsp;or both -&nbsp;Python &amp;&nbsp;R. Pick the programming language that you need for your career.</p>\n<p>This course is&nbsp;fun and exciting, and at the same time, we dive deep into Machine Learning. It is structured the following way:</p>\n<ul>\n<li>\n<p>Part 1 - Data Preprocessing</p>\n</li>\n<li>\n<p>Part 2 - Regression: Simple Linear Regression, Multiple Linear Regression,&nbsp;Polynomial&nbsp;Regression,&nbsp;SVR, Decision Tree Regression,&nbsp;Random Forest Regression</p>\n</li>\n<li>\n<p>Part 3 - Classification: Logistic Regression, K-NN, SVM, Kernel SVM, Naive Bayes, Decision Tree Classification,&nbsp;Random&nbsp;Forest Classification</p>\n</li>\n<li>\n<p>Part 4 - Clustering: K-Means,&nbsp;Hierarchical Clustering</p>\n</li>\n<li>\n<p>Part 5 - Association Rule Learning: Apriori,&nbsp;Eclat</p>\n</li>\n<li>\n<p>Part 6 - Reinforcement Learning:&nbsp;Upper Confidence Bound,&nbsp;Thompson Sampling</p>\n</li>\n<li>\n<p>Part 7 - Natural Language Processing: Bag-of-words model&nbsp;and&nbsp;algorithms for NLP</p>\n</li>\n<li>\n<p>Part 8 - Deep Learning: Artificial Neural Networks,&nbsp;Convolutional Neural Networks</p>\n</li>\n<li>\n<p>Part 9 - Dimensionality Reduction: PCA, LDA, Kernel PCA</p>\n</li>\n<li>\n<p>Part 10 - Model Selection &amp; Boosting: k-fold Cross Validation, Parameter Tuning, Grid Search,&nbsp;XGBoost</p>\n</li>\n</ul>\n<p>Each section inside each part is independent. So you can either take the whole course from start to finish or you can jump right into any specific section and&nbsp;<strong>learn what you need for your career right now</strong>.</p>\n<p>Moreover, the course is packed with practical exercises that are based on&nbsp;<strong>real-life&nbsp;case studies</strong>. So not only will you learn the theory, but you will also get lots of&nbsp;<strong>hands-on practice</strong>&nbsp;building your own models.</p>\n<p>And as a bonus, this course&nbsp;<strong>includes both&nbsp;Python and R&nbsp;code templates&nbsp;</strong>which you can download and use on your own projects.</p>\n</div>\n<div class=\"styles--audience--2xuzW\" data-purpose=\"target-audience\">\n<h2 class=\"ud-heading-xl styles--audience__title--1qhlO\">Who this course is for:</h2>\n<ul class=\"styles--audience__list--16EaN\">\n<li>Anyone interested in Machine Learning.</li>\n<li>Students who have at least high school knowledge in math and who want to start learning Machine Learning.</li>\n<li>Any intermediate level people who know the basics of machine learning, including the classical algorithms like linear regression or logistic regression, but who want to learn more about it and explore all the different fields of Machine Learning.</li>\n<li>Any people who are not that comfortable with coding but who are interested in Machine Learning and want to apply it easily on datasets.</li>\n<li>Any students in college who want to start a career in Data Science.</li>\n<li>Any data analysts who want to level up in Machine Learning.</li>\n<li>Any people who are not satisfied with their job and who want to become a Data Scientist.</li>\n<li>Any people who want to create added value to their business by using powerful Machine Learning tools.</li>\n</ul>\n</div>\n</div>\n</div>\n</div>\n</div>', '2023-04-21', '12:00:00', NULL, 'http://res.cloudinary.com/dmhjrwkme/image/upload/v1682620637/dk23ha54xm2y6mzcvfkx.jpg', 1, 'Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]', 1, '2023-04-19', '10:20:00', 5, 4, 'https://meet.google.com/agf-ndyt-ijz');

=======
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

>>>>>>> origin/main
-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `course_detail`
--

CREATE TABLE `course_detail` (
  `id` bigint(20) NOT NULL,
<<<<<<< HEAD
  `content` mediumtext DEFAULT NULL,
=======
  `content` varchar(255) DEFAULT NULL,
>>>>>>> origin/main
  `created_date` datetime DEFAULT NULL,
  `image_banner` varchar(255) DEFAULT NULL,
  `link_video` varchar(255) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `history`
--

CREATE TABLE `history` (
  `id` bigint(20) NOT NULL,
  `course_detail_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `major`
--

CREATE TABLE `major` (
  `id` bigint(20) NOT NULL,
  `imagebanner` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

<<<<<<< HEAD
--
-- Đang đổ dữ liệu cho bảng `major`
--

INSERT INTO `major` (`id`, `imagebanner`, `description`, `name`) VALUES
(1, 'http://res.cloudinary.com/dt2g4oabz/image/upload/v1679459266/puh2gtoopyuzrjdjr6h9.jpg', NULL, 'Businesss'),
(2, 'http://res.cloudinary.com/dt2g4oabz/image/upload/v1679459280/q8brhfz6rcoh95fp1us1.jpg', NULL, 'Design'),
(3, 'http://res.cloudinary.com/dt2g4oabz/image/upload/v1679459299/izpsxhyurnd0fj3npifn.jpg', NULL, 'English'),
(4, 'http://res.cloudinary.com/dt2g4oabz/image/upload/v1679459313/wpzhj33s2mtu1php9can.png', NULL, 'Event'),
(5, 'http://res.cloudinary.com/dt2g4oabz/image/upload/v1679459334/hb0ksbquph3tuoiold88.jpg', NULL, 'Information Technology'),
(7, 'http://res.cloudinary.com/dt2g4oabz/image/upload/v1679459367/tdxds2tf5fuon6asai9f.jpg', NULL, 'Music'),
(8, 'http://res.cloudinary.com/dt2g4oabz/image/upload/v1679459384/exibsom9kyr3xvdgyfo1.jpg', NULL, 'Photography'),
(9, 'http://res.cloudinary.com/dt2g4oabz/image/upload/v1679459401/yystj1hc6k05vgq0pjvw.jpg', NULL, 'Soft Skills'),
(10, 'http://res.cloudinary.com/dmhjrwkme/image/upload/v1682630582/yrwivuf0gzyif8t3qzpt.png', NULL, 'Construction Industry');

=======
>>>>>>> origin/main
-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `major_interest`
--

CREATE TABLE `major_interest` (
  `id` bigint(20) NOT NULL,
  `major_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

<<<<<<< HEAD
--
-- Đang đổ dữ liệu cho bảng `major_interest`
--

INSERT INTO `major_interest` (`id`, `major_id`, `user_id`) VALUES
(56, 5, 8),
(105, 2, 5),
(107, 5, 15),
(138, 5, 16),
(139, 8, 16),
(145, 3, 18),
(146, 4, 18),
(147, 5, 18),
(148, 7, 18),
(149, 8, 18),
(150, 1, 17),
(151, 3, 17),
(152, 5, 17),
(153, 8, 17),
(158, 2, 4),
(159, 5, 4),
(172, 5, 20),
(173, 7, 20),
(174, 8, 20),
(175, 9, 20);

=======
>>>>>>> origin/main
-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subcriabled_course`
--

CREATE TABLE `subcriabled_course` (
  `id` bigint(20) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `paid` int(11) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
<<<<<<< HEAD
  `user_id` bigint(20) DEFAULT NULL,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `subcriabled_course`
--

INSERT INTO `subcriabled_course` (`id`, `created_date`, `paid`, `course_id`, `user_id`, `price`) VALUES
(7, '2023-04-13 15:05:26', 1, 1, 5, 35),
(10, '2023-04-19 14:39:19', 1, 3, 5, 99),
(14, '2023-04-22 22:17:18', 1, 2, 8, 55),
(15, '2023-04-24 15:58:05', 1, 2, 5, 55),
(16, '2023-04-28 00:14:56', 1, 3, 8, 99),
(17, '2023-04-28 17:10:05', 0, 9, 5, 20);

=======
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

>>>>>>> origin/main
-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `account_holder` varchar(255) DEFAULT NULL,
  `activation_key` varchar(255) DEFAULT NULL,
  `actived` int(11) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `bank_account_number` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `remember_key` varchar(255) DEFAULT NULL,
<<<<<<< HEAD
  `username` varchar(255) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL
=======
  `username` varchar(255) DEFAULT NULL
>>>>>>> origin/main
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

<<<<<<< HEAD
INSERT INTO `user` (`id`, `account_holder`, `activation_key`, `actived`, `avatar`, `bank_account_number`, `bank_name`, `created_date`, `email`, `fullname`, `password`, `phone`, `remember_key`, `username`, `description`) VALUES
(1, NULL, NULL, 1, NULL, NULL, NULL, '2023-02-20 18:28:05', 'admin@gmail.com', NULL, '$2a$10$iht6mCEQGHHBHtGnLGQKru8YF0yuyHOO5FQKc3.gQs0Lz9PDbU67S', NULL, NULL, 'admin', NULL),
(3, NULL, 'keXyEXPoLt', 0, NULL, NULL, NULL, '2023-02-21 15:18:12', 'hantinh311002102000@gmail.com', 'khánh ngọc', '$2a$10$qIfc5.LjIjuz/Ob3aazLnulorqlvQufK61pXbf8pCw34FUDqW7ld6', '097213122', NULL, 'ngockt', NULL),
(4, NULL, 'ZkrFn35KU5', 1, 'http://res.cloudinary.com/dmhjrwkme/image/upload/v1682591722/apqw8po3td99g5jbdaqe.jpg', NULL, NULL, '2023-03-22 11:31:21', 'vscocamkn2@gmail.com', 'David Nguyen', '$2a$10$OeKH3wCGf1a22YcVHvBbd.69I0kM8JGJ2P6sWrIGd0yFaXTrnodje', '0987438350', NULL, 'tungtt', '<p>David is a reputable and experienced cybersecurity and information security training expert in Vietnam. With more than 20 years of training experience, CertMaster Dong Duong has trained tens of thousands of students who are employees of important corporations and agencies in Vietnam such as the Ministry of National Defense, the Ministry of Finance and the Departments of Information and Communications. or large enterprises such as Banks, Airports, VNPT, Mobifone...</p>\n<p>In addition, CertMaster Dong Duong is also one of the top instructors of EC Council in the Asia Pacific region (top 5). This shows that CertMaster Dong Duong is a reliable and quality training partner for organizations and businesses looking for specialized courses in cybersecurity and information security.</p>\n<p>CertMaster Dong Duong is committed to providing students with quality courses that meet the actual needs of organizations and businesses, along with continuously updated curriculum and training materials to ensure that Students learn and apply the latest and most effective knowledge.</p>\n<p><span style=\"font-family: tahoma, arial, helvetica, sans-serif;\">CertMaster Dong Duong cam kết mang đến cho học vi&ecirc;n những kh&oacute;a học chất lượng, đ&aacute;p ứng được nhu cầu thực tế của c&aacute;c tổ chức v&agrave; doanh nghiệp, c&ugrave;ng với c&aacute;c gi&aacute;o tr&igrave;nh v&agrave; t&agrave;i liệu đ&agrave;o tạo được cập nhật li&ecirc;n tục để đảm bảo rằng học vi&ecirc;n được học tập v&agrave; &aacute;p dụng những kiến thức mới nhất v&agrave; hiệu quả nhất.</span></p>'),
(5, NULL, 'ldy7xLmIEf', 1, 'http://res.cloudinary.com/dmhjrwkme/image/upload/v1682418596/for3fgunhzr93nyvl3f0.png', NULL, NULL, '2023-03-22 14:10:40', 'khanhngoc04032000@gmail.com', 'Duong Khanh Ngoc', '$2a$10$jslKFd1RrBofO8VbPBWizuY3m6E3tzmPMkP2qAnv3IIadGUwY6I2G', '0779814377', NULL, 'khanhngoc', ''),
(8, NULL, 'RKIyK6KhW2', 1, 'http://res.cloudinary.com/dt2g4oabz/image/upload/v1680777631/of91aym9vzvl5mhu8l4l.jpg', NULL, NULL, '2023-04-05 22:22:48', 'vscocamkn2@gmail.com', 'Andy Nguyen', '$2a$10$o/sqTh04Lf50hkqtJnEjWeidN19VD7jq5YnLkuK.AwRlSer4YZkZO', '0857882137', NULL, 'andynn', ''),
(14, NULL, 'sGoOu88hkF', 1, 'http://res.cloudinary.com/dt2g4oabz/image/upload/v1681281929/aj6cyhi6ogmxnjrgsklh.jpg', NULL, NULL, '2023-04-12 13:45:29', 'huy1@gmail.com', 'Duong Khanh Ngoc', '$2a$10$vvChbHwK9SQCnjT7GDU.TOVlzBMIMmDKI8Bh.mHo7Ws58YFKyS5Fa', '0779814377', NULL, 'khanhngoc1', NULL),
(15, NULL, 'cLF46GOChb', 1, 'http://res.cloudinary.com/dmhjrwkme/image/upload/v1682424471/qo38vfrwrf9hx98mgxr5.jpg', NULL, NULL, '2023-04-25 19:07:52', 'vscocamkn3@gmail.com', 'Jame ', '$2a$10$jzl2gqH0nuFXQPU0TVPYoeodFjtPfokY.GTUW6kqSW3TAD1Z5DMhC', '0857882137', NULL, 'jame', ''),
(16, NULL, 'fC32FhL9vv', 1, 'http://res.cloudinary.com/dmhjrwkme/image/upload/v1682589691/gijabd6litvtbiubhfpx.jpg', NULL, NULL, '2023-04-27 17:01:32', 'kienle0660@gmail.com', 'Kevin Drip', '$2a$10$8w5m769P5c8vVI4d5I/oZeIhkGafPKGhex9SX2N8b.gcsiHfjANaC', '0985649355', NULL, 'Kevin', '<p>As an economics and maths tutor, I take great pride in my teaching style, which I have developed to be both engaging and effective. I firmly believe that every student is unique and learns in their own way. Therefore, I prepare each lesson specifically for the student it was intended for, tailoring my teaching approach to suit their individual needs and learning style.</p>\n<p>When I meet a new student, I take the time to get to know them and their goals, so that I can create a customized lesson plan that addresses their specific strengths and weaknesses. This approach allows me to personalize my teaching, which I find not only makes the material more accessible, but also helps the student to stay engaged and motivated throughout the learning process.</p>\n<p>To keep things interesting and dynamic, I incorporate a variety of teaching methods into each lesson. For example, I might use real-world examples, games, or interactive exercises to help my students understand and apply the concepts they are learning. I also make sure to use language that is easy to understand and avoid jargon as much as possible, so that my students are not overwhelmed by complex terminology.</p>'),
(17, NULL, 'eRvRzWesxZ', 1, 'http://res.cloudinary.com/dmhjrwkme/image/upload/v1682590682/obd6lsonf6fev6w2zgbo.jpg', NULL, NULL, '2023-04-27 17:04:17', 'nguyenngocnhan2104@gmail.com', 'Ocan Nguyen', '$2a$10$JuFxnFYTs5XCgii68eykq.J3xykjckBgpQUZy6CO5XfPJJShde8YG', '0857882137', NULL, 'Ocan', '<p>I graduated from the University of Colombo, Sri Lanka and was one of the only 6 students in my batch to get selected to a special degree in Mathematics. After ALs, I took the Sixth Term Examination Papers (STEP) which is the entrance exam for Mathematics at the University of Cambridge where I scored 1 and S for STEP 2 and STEP 3 papers. After graduation I was enrolled at the University of Chicago as a Graduate Student At Large. Currently following M.Sc in Mathematics at the University of Kaiserslautern, Germany. My areas of interest are Arithmetic Geometry and Algebraic Geometry.</p>'),
(18, NULL, 'Wp3BOWHu03', 1, 'http://res.cloudinary.com/dmhjrwkme/image/upload/v1682590742/sdy5kdnahjcy27eyttqj.webp', NULL, NULL, '2023-04-27 17:13:04', 'pagepresetlightroomfree@gmail.com', 'Keelin', '$2a$10$Bo.oVWhEDN2f9uYrLfZOaeMeSH2RFBHb2YyXlmyhaNxJcLhG4pk2G', '0779814377', NULL, 'keelin', '<p>My passion for teaching and learning mathematics took my career abroad to pursue my PhD in Mathematics Education in the United Kingdom four years ago. During the past four years, I employed 3D technology on primary school teachers in the United Kingdom to help them teach mathematics to their students. Also, I learned the English National Curriculum from key stages 1 to 4 and early years. Currently, I am the associate head of mathematics at Northeastern University-London. Here, I employ an innovative pedagogical teaching style to help American students from across the pond to learn about topics in Calculus for Business, Differential Equations and Linear Algebra. Also, I combined both the English National Curriculum and Common Core in the United States to give students a flavour of the two countries\' learning styles. <br><br>My eight-year experience tutoring U.S admission examinations (SAT, ACT, GRE, GMAT) and teaching in the United States prepared me to become an elite IVY league tutor. My goal is to help students achieve their goals as future academic students. On my side time, I conduct outreach to lower-income schools providing students with the opportunity to play, engage, and design with 3D technology tools such as 3D printing pens, 3D modelling software, and 3D printers. Lastly, I am passionate about ice skating, travelling and trying out new restaurants. <br><br>I warmly thank you for taking the time to read my biography. If you choose to work with me, I look forward to showing you how to become an excellent test-taker and lower your anxiety towards the examination.</p>'),
(19, NULL, 'Em47yf4ZQi', 1, 'http://res.cloudinary.com/dmhjrwkme/image/upload/v1682590527/b4tebckfn3sicuusxnmn.jpg', NULL, NULL, '2023-04-27 17:15:28', 'huevubosslightroom@gmail.com', 'Louisa', '$2a$10$FV9N4A5.PogkHEIvlCOzduIoAFT3Z4dv08/VBlndqzPCPvolodtO.', '0779814377', NULL, 'louisa', NULL),
(20, NULL, '9GOjz2fDp4', 1, 'http://res.cloudinary.com/dmhjrwkme/image/upload/v1682593020/yd7ttfg5pvczdpqrmdd8.jpg', NULL, NULL, '2023-04-27 17:57:00', 'vscocamkn6@gmail.com', 'Dominic', '$2a$10$WMBPhRk0WKt9Wm.06nN8eeLtgnIb59J8Gb8dw.SzbjlffohxBrQ/O', '0779814377', NULL, 'dominic', '<p>Dominic is a solutions architect, consultant and software developer that has a particular interest in all things related to Big Data, Cloud &amp; API. He\'s also a many-times best seller instructor on Udemy for his courses in&nbsp;<strong>AWS</strong>&nbsp;and&nbsp;<strong>Apache Kafka</strong>.</p>\n<p><strong>[See FAQ&nbsp;below to see in which order you can take my courses]</strong></p>\n<p>St&eacute;phane is recognized as an&nbsp;<strong>AWS Hero</strong>&nbsp;and is an&nbsp;<strong>AWS Certified Solutions Architect Professional &amp; AWS Certified DevOps Professional</strong>. He loves to teach people how to use the AWS&nbsp;properly, to get them ready for their&nbsp;<strong>AWS&nbsp;certifications</strong>, and most importantly for the real world.</p>\n<p>He also loves&nbsp;<strong>Apache Kafka</strong>.&nbsp;He sits on the 2019 Program Committee organizing the Kafka Summit in New York, London and San Francisco.&nbsp;He is also an active member of the Apache Kafka community, authoring blogs on Medium and a guest blog for Confluent. &nbsp;</p>\n<p>During his spare time&nbsp;he enjoys cooking, practicing yoga, surfing,&nbsp;watching TV shows, and traveling&nbsp;to awesome destinations!</p>\n<p>&nbsp;</p>\n<p><strong>FAQ:&nbsp;In which order should you&nbsp;learn?...</strong></p>\n<p><strong>AWS&nbsp;Cloud:</strong>&nbsp;Start with AWS&nbsp;Certified Solutions Architect Associate, then move on to AWS&nbsp;Certified Developer Associate and then AWS&nbsp;Certified SysOps Administrator.&nbsp;Afterwards you can either do AWS Certified Solutions Architect Professional or AWS&nbsp;Certified DevOps Professional, or a specialty certification of your choosing.</p>\n<p>&nbsp;</p>\n<p><strong>Apache Kafka:</strong>&nbsp;Start with Apache Kafka for Beginners, then you can learn Connect, Streams and Schema Registry if you\'re a developer, and Setup and Monitoring courses if you\'re an admin. Both tracks are needed to pass the Confluent Kafka certification.</p>');
=======
INSERT INTO `user` (`id`, `account_holder`, `activation_key`, `actived`, `avatar`, `bank_account_number`, `bank_name`, `created_date`, `email`, `fullname`, `password`, `phone`, `remember_key`, `username`) VALUES
(1, NULL, NULL, 1, NULL, NULL, NULL, '2023-02-20 18:28:05', 'admin@gmail.com', NULL, '$2a$10$iht6mCEQGHHBHtGnLGQKru8YF0yuyHOO5FQKc3.gQs0Lz9PDbU67S', NULL, NULL, 'admin'),
(3, NULL, 'keXyEXPoLt', 1, NULL, NULL, NULL, '2023-02-21 15:18:12', 'hantinh311002102000@gmail.com', 'khánh ngọc', '$2a$10$qIfc5.LjIjuz/Ob3aazLnulorqlvQufK61pXbf8pCw34FUDqW7ld6', '097213122', NULL, 'ngockt');
>>>>>>> origin/main

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_authority`
--

CREATE TABLE `user_authority` (
  `user_id` bigint(20) NOT NULL,
  `authority_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user_authority`
--

INSERT INTO `user_authority` (`user_id`, `authority_name`) VALUES
(1, 'ROLE_ADMIN'),
<<<<<<< HEAD
(3, 'ROLE_USER'),
(4, 'ROLE_TEACHER'),
(5, 'ROLE_USER'),
(8, 'ROLE_USER'),
(14, 'ROLE_USER'),
(15, 'ROLE_TEACHER'),
(16, 'ROLE_TEACHER'),
(17, 'ROLE_TEACHER'),
(18, 'ROLE_TEACHER'),
(19, 'ROLE_USER'),
(20, 'ROLE_TEACHER');
=======
(3, 'ROLE_USER');
>>>>>>> origin/main

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `authority`
--
ALTER TABLE `authority`
  ADD PRIMARY KEY (`name`);

--
-- Chỉ mục cho bảng `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpxk2jtysqn41oop7lvxcp6dqq` (`user_id`);

--
-- Chỉ mục cho bảng `chatting`
--
ALTER TABLE `chatting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKi2oygmwyh4v8lhkg57i04xelo` (`receiver`),
  ADD KEY `FKsub5xxh4fxjln7t55r4n30idj` (`sender`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKdsub2q6m6519rpas8b075fr7m` (`course_id`),
  ADD KEY `FK8kcum44fvpupyw6f5baccx25c` (`user_id`);

--
-- Chỉ mục cho bảng `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKgp5js8rx4t3k96iebp3qn3tlc` (`major_id`),
  ADD KEY `FKo3767wbj6ow5axv38qej0gxo9` (`user_id`);

--
-- Chỉ mục cho bảng `course_detail`
--
ALTER TABLE `course_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKonm6feulb9dmgri1ywpvid8l2` (`course_id`);

--
-- Chỉ mục cho bảng `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKt36dcwgfsnfypwxluo0t1t7yp` (`course_detail_id`),
  ADD KEY `FKn4gjyu69m6xa5f3bot571imbe` (`user_id`);

--
-- Chỉ mục cho bảng `major`
--
ALTER TABLE `major`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `major_interest`
--
ALTER TABLE `major_interest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKknr7l52cccbvnupumokki8mhq` (`major_id`),
  ADD KEY `FKlqwo6fxk02t1y2upwyotghyty` (`user_id`);

--
-- Chỉ mục cho bảng `subcriabled_course`
--
ALTER TABLE `subcriabled_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkd6d95xl8kl1s3y3ih3vhwx09` (`course_id`),
  ADD KEY `FK8hxh163lu0h54o5d7nw8intvg` (`user_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_authority`
--
ALTER TABLE `user_authority`
  ADD PRIMARY KEY (`user_id`,`authority_name`),
  ADD KEY `FK6ktglpl5mjosa283rvken2py5` (`authority_name`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `blog`
--
ALTER TABLE `blog`
<<<<<<< HEAD
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
=======
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
>>>>>>> origin/main

--
-- AUTO_INCREMENT cho bảng `chatting`
--
ALTER TABLE `chatting`
<<<<<<< HEAD
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
=======
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
>>>>>>> origin/main

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
<<<<<<< HEAD
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
=======
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
>>>>>>> origin/main

--
-- AUTO_INCREMENT cho bảng `course`
--
ALTER TABLE `course`
<<<<<<< HEAD
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
=======
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
>>>>>>> origin/main

--
-- AUTO_INCREMENT cho bảng `course_detail`
--
ALTER TABLE `course_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `history`
--
ALTER TABLE `history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `major`
--
ALTER TABLE `major`
<<<<<<< HEAD
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
=======
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
>>>>>>> origin/main

--
-- AUTO_INCREMENT cho bảng `major_interest`
--
ALTER TABLE `major_interest`
<<<<<<< HEAD
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;
=======
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
>>>>>>> origin/main

--
-- AUTO_INCREMENT cho bảng `subcriabled_course`
--
ALTER TABLE `subcriabled_course`
<<<<<<< HEAD
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
=======
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
>>>>>>> origin/main

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
<<<<<<< HEAD
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
=======
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
>>>>>>> origin/main

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `FKpxk2jtysqn41oop7lvxcp6dqq` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `chatting`
--
ALTER TABLE `chatting`
  ADD CONSTRAINT `FKi2oygmwyh4v8lhkg57i04xelo` FOREIGN KEY (`receiver`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKsub5xxh4fxjln7t55r4n30idj` FOREIGN KEY (`sender`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK8kcum44fvpupyw6f5baccx25c` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKdsub2q6m6519rpas8b075fr7m` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`);

--
-- Các ràng buộc cho bảng `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `FKgp5js8rx4t3k96iebp3qn3tlc` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`),
  ADD CONSTRAINT `FKo3767wbj6ow5axv38qej0gxo9` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `course_detail`
--
ALTER TABLE `course_detail`
  ADD CONSTRAINT `FKonm6feulb9dmgri1ywpvid8l2` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`);

--
-- Các ràng buộc cho bảng `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `FKn4gjyu69m6xa5f3bot571imbe` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKt36dcwgfsnfypwxluo0t1t7yp` FOREIGN KEY (`course_detail_id`) REFERENCES `course_detail` (`id`);

--
-- Các ràng buộc cho bảng `major_interest`
--
ALTER TABLE `major_interest`
  ADD CONSTRAINT `FKknr7l52cccbvnupumokki8mhq` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`),
  ADD CONSTRAINT `FKlqwo6fxk02t1y2upwyotghyty` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `subcriabled_course`
--
ALTER TABLE `subcriabled_course`
  ADD CONSTRAINT `FK8hxh163lu0h54o5d7nw8intvg` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKkd6d95xl8kl1s3y3ih3vhwx09` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`);

--
-- Các ràng buộc cho bảng `user_authority`
--
ALTER TABLE `user_authority`
  ADD CONSTRAINT `FK6ktglpl5mjosa283rvken2py5` FOREIGN KEY (`authority_name`) REFERENCES `authority` (`name`),
  ADD CONSTRAINT `FKpqlsjpkybgos9w2svcri7j8xy` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
