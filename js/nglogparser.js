const { Parser } = require('@robojones/nginx-log-parser')
const { Console } = require('console')

/** The schema from the nginx config. */
const schema = '$remote_addr - $remote_user [$time_local] "$request" $status $bytes_sent "$http_referer" "$http_user_agent"'

/** An example line from the /ver/log/nginx/acces.log file */
const line = '127.0.0.1 - - [07/Jul/2018:17:37:28 +0200] "GET /7d32ce87648a4050faca.hot-update.json HTTP/1.1" 200 43'
	+ ' "http://test.local/" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0"'

// Create a parser that can read our log schema.
const parser = new Parser(schema)

// Parse a line
const result = parser.parseLine(line)
console.log(result)
