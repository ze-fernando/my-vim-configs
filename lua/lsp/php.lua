local lspconfig = require("lspconfig")

lspconfig.intelephense.setup({
  settings = {
    intelephense = {
      files = {
        maxSize = 5000000,
      },
      stubs = {
        "apache", "bcmath", "bz2", "calendar", "Core", "ctype",
        "curl", "date", "dba", "dom", "enchant", "exif", "FFI",
        "fileinfo", "filter", "fpm", "ftp", "gd", "gettext", "gmp",
        "hash", "iconv", "imap", "intl", "json", "ldap", "libxml",
        "mbstring", "meta", "mysqli", "oci8", "odbc", "openssl",
        "pcntl", "pcre", "PDO", "pdo_mysql", "pdo_pgsql",
        "pdo_sqlite", "pgsql", "Phar", "posix", "pspell", "readline",
        "Reflection", "session", "shmop", "SimpleXML", "snmp",
        "soap", "sockets", "sodium", "SPL", "sqlite3", "standard",
        "superglobals", "sysvmsg", "sysvsem", "sysvshm", "tidy",
        "tokenizer", "xml", "xmlreader", "xmlrpc", "xmlwriter",
        "xsl", "Zend OPcache", "zip", "zlib",
        "Laravel", "Eloquent"
      },
    },
  },
})
