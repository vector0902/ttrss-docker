<?php
	// Database configuration
	define('DB_TYPE', 'pgsql');
	define('DB_HOST', 'localhost');
	define('DB_PORT', '5432');
	define('DB_NAME', 'ttrss');
	define('DB_USER', 'ttrss');
	define('DB_PASS', 'ttrss');

	// Connection options for PDO
	// See: http://www.php.net/manual/en/pdo.construct.php
	define('DB_PERSISTENT', false);
	define('DB_CHECK_ENCODING', true);

	// Misc settings
	define('SINGLE_USER_MODE', false);
	define('REG_NOTIFY_ADDRESS', 'user@domain.com');
	define('SMTP_FROM_NAME', 'Tiny Tiny RSS');
	define('SMTP_FROM_ADDRESS', 'noreply@domain.com');

	// Automatically register new users after they login for the first time
	define('REG_ALLOW_REGISTER', false);

	// Set to true to allow user self-registration.
	define('REG_AUTO_LOGIN', true);

	// Automatically login user after registration.
	define('FEED_CRAWLER_TIMEOUT', 60);

	// How long to wait for feed response (in seconds, integer).
	define('HTTP_PROXY', '');

	// Optional HTTP proxy to use when fetching feeds.
	define('CHECK_FOR_NEW_VERSION', true);

	// Check for new versions of tt-rss when loading main page.
	define('ENABLE_GZIP_OUTPUT', false);

	// Compress output on the fly.
	define('PLUGINS', 'auth_internal, note');

	// Comma-separated list of plugins to load automatically.
	define('LOG_DESTINATION', 'sql');

	// Where to log, 'syslog' or 'sql'.
	define('CONFIG_VERSION', 26);

	// Do not change this.
?>