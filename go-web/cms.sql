create table `pages` (
	`id` int(11) unsigned not null auto_increment,
	`page_guid` varchar(256) not null default '',
	`page_title` varchar(256) default null,
	`page_content` mediumtext,
	`page_date` timestamp not null
	default current_timestamp on
	update current_timestamp,
	primary key (`id`),
	unique key `page_guid`
	(`page_guid`)  # What's the meaning?
) engine=InnoDB auto_increment=2
default charset=latin1;


# Add some data
insert into `pages` (`id`, `page_guid`, `page_title`, `page_content`, `page_date`)
values (1, 'hello-world', 'Hello, World', 'I\'m so glad you found this page! balabala.', current_timestamp);

# Add some data
insert into `pages` (`id`, `page_guid`, `page_title`, `page_content`, `page_date`)
values (2, 'a-new-blog', 'A New Blog', 'I hope you enjor the last blog! Well brace yourself.', '2015-04-29 02:16:19');


# Add some data
insert into `pages` (`id`, `page_guid`, `page_title`, `page_content`, `page_date`)
values (3, 'lorem-ipsum', 'Lorem Ipsum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sem tortor, lobortis in posuere sit amet, ornare non eros. Pellentesque vel lorem sed nisl dapibus fringilla. In pretium...', '2015-05-06 04:09:45');

