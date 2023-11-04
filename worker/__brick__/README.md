# {{name.lowerCase().paramCase()}}

{{description}}

---

This worker was bootstrapped using [worker brick](https://github.com/dart-pacotes/.brick) and configured with [wrangler](https://github.com/cloudflare/wrangler) CLI. You can install it via NPM: `npm install -g wrangler`

## Development

To properly run this service, you will need to a set up a `.dev.vars` file. Start by creating a copy of the `.dev.vars.tpl` file and fill the variables with values appropriate for the execution context.

|    Variable Name    | Variable Description |
| :-----------------: | :------------------- |
|   `AWESOME_SECRET`  |    Awesome Secret.   |

Run the local server via `npm run start`

{{^isFetchWorker}}
Trigger an instant cronjob via `curl "http://localhost:8787/__scheduled?cron=*+*+*+*+*"` 
{{/isFetchWorker}}

## Deploy

Setup worker environment variables with the following one-line:

```bash
IFS='='; ENV_FILE=.dev.vars; cat $ENV_FILE | while read line || [[ -n $line ]]; do read -ra envy <<< $line; wrangler secret put ${envy[0]} <<< ${envy[1]} ; done
```

Deploy to Cloudflare via `npm run deploy`

### Contact

This template was prepared by:

- João Freitas, @freitzzz
- Rute Santos, @rutesantos4

Contact us if you need help on your project!