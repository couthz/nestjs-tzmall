# Yargs中文文档

**Yargs是一个用于创建node.js命令行的库**

## 基础

### 说明 :

Yargs通过解析参数和生成优雅的用户界面来帮助您构建交互式命令行工具。

它为你提供:

* 命令和（分组）选项 (`my-program.js serve --port=5000`)。
* 根据您的参数动态生成的帮助菜单。

> <img width="400" src="https://pic.phpna.com/media/20191207232216.png">

* 命令和选项的bash-completion快捷方式.
* [更多api](https://github.com/yargs/yargs/blob/master/docs/api.md).

### 安装

稳定版本:
```bash
npm i yargs
```

最新版本:
```bash
npm i yargs@next
```

### 用法 :

#### 简单示例

````javascript
#!/usr/bin/env node
const argv = require('yargs').argv

if (argv.ships > 3 && argv.distance < 53.5) {
  console.log('Plunder more riffiwobbles!')
} else {
  console.log('Retreat from the xupptumblers!')
}
````

```bash
$ ./plunder.js --ships=4 --distance=22
Plunder more riffiwobbles!

$ ./plunder.js --ships 12 --distance 98.7
Retreat from the xupptumblers!
```

#### 比较复杂的案例

```javascript
#!/usr/bin/env node
require('yargs') // eslint-disable-line
  .command('serve [port]', 'start the server', (yargs) => {
    yargs
      .positional('port', {
        describe: 'port to bind on',
        default: 5000
      })
  }, (argv) => {
    if (argv.verbose) console.info(`start server on :${argv.port}`)
    serve(argv.port)
  })
  .option('verbose', {
    alias: 'v',
    default: false
  })
  .argv
```

运行上面的示例并加上 `--help` 选项以查看应用程序的帮助。

## TypeScript

yargs 的类型定义在 [@types/yargs][type-definitions]包中,请先安装此包

```
npm i @types/yargs --save-dev
```

### TypeScript用法示例

TypeScript的定义 需要考虑到 yargs的 `type` 键以及`demandOption`/`default`(如果存在的话)。

`.options()`定义如下：

```typescript
#!/usr/bin/env node
import * as yargs from 'yargs';

const argv = yargs.options({
  a: { type: 'boolean', default: false },
  b: { type: 'string', demandOption: true },
  c: { type: 'number', alias: 'chill' },
  d: { type: 'array' },
  e: { type: 'count' },
  f: { choices: ['1', '2', '3'] }
}).argv;
```

则`argv`返回的值的类型会像下面这样子：

```typescript
{
  [x: string]: unknown;
  a: boolean;
  b: string;
  c: number | undefined;
  d: (string | number)[] | undefined;
  e: number;
  f: string | undefined;
  _: string[];
  $0: string;
}
```

您可能希望为应用程序定义一个接口，描述解析`argv`后将采用的形式：

```typescript
interface Arguments {
  [x: string]: unknown;
  a: boolean;
  b: string;
  c: number | undefined;
  d: (string | number)[] | undefined;
  e: number;
  f: string | undefined;
}
```

要改进`choices`选项类型，您还可以指定它的类型：

```typescript
type Difficulty = 'normal' | 'nightmare' | 'hell';
const difficulties: ReadonlyArray<Difficulty> = ['normal', 'nightmare', 'hell'];

const argv = yargs.option('difficulty', {
  choices: difficulties,
  demandOption: true
}).argv;
```

`argv`会得到类型`'normal' | 'nightmare' | 'hell'`。

## 解析技巧

<a name="stop"></a>

### 停止解析

使用 `—`标志来停止解析,此标志后的参数将会放入 `argv._`.

    $ node examples/reflect.js -a 1 -b 2 -- -c 3 -d 4
    { _: [ '-c', '3', '-d', '4' ],
      a: 1,
      b: 2,
      '$0': 'examples/reflect.js' }

<a name="negate"></a>

### 设置字段为false

如果要将字段显式设置为false而不是将其保留为未定义或覆盖默认值，则可以执行此操作`--no-key`。

    $ node examples/reflect.js -a --no-b
    { _: [], a: true, b: false, '$0': 'examples/reflect.js' }

<a name="numbers"></a>

### 整型

每个看起来像数字（`!isNaN(Number(arg))`）的参数都会转换为一个。通过这种方式，你可以直接`net.createConnection(argv.port)`并且你可以在`argv`之外使用`+`添加数字,不过这样是产生没有意义的并列值，这非常令人沮丧。

<a name="arrays"></a>
### 数组

如果多次指定一个标志，它将变为一个包含所有值的数组。

    $ node examples/reflect.js -x 5 -x 8 -x 0
    { _: [], x: [ 5, 8, 0 ], '$0': 'examples/reflect.js' }

您还可以将选项配置为[type `array`](https://github.com/yargs/yargs/blob/master/docs/api.md#array)，以支持表单的数组`-x 5 6 7 8`。

<a name="objects"></a>
### 对象

当你在参数名中使用点符号（`.`s）时，将假定一个隐式对象路径。这使您可以将参数组织到嵌套对象中。

    $ node examples/reflect.js --foo.bar.baz=33 --foo.quux=5
    { _: [],
      foo: { bar: { baz: 33 }, quux: 5 },
      '$0': 'examples/reflect.js' }

<a name="quotes"></a>

### 问题

当您使用包含破折号（`-`）的字符串参数时，shell会将这些参数视为单独的选项，而不是字符串的一部分。问题是像bash这样的shell往往会删除引号。解决方案是将字符串包装在两组引号中。

在单引号内使用双引号。

```
$ node examples/reflect.js --foo '"--hello -x=yes -v"'
{ _: [], foo: '--hello -x=yes -v',
  '$0': 'examples/reflect.js' }
```

在双引号内转义双引号。

```
$ node examples/reflect.js --foo "\"--hello -x=yes -v\""
{ _: [], foo: '--hello -x=yes -v',
  '$0': 'examples/reflect.js' }
```

## 高级主题

<a name="commands"></a>

### 命令

Yargs提供了一组强大的工具来组成模块化命令驱动的应用程序。在本节中，我们将介绍此API中提供的一些高级功能：

#### 默认命令

要指定默认命令，请使用字符串`*`或`$0`。如果提供的位置参数与未知命令匹配，则将运行默认命令。默认命令允许您使用与子命令类似的API来定义应用程序的端点。

```js
const argv = require('yargs')
  .command('$0', 'the default command', () => {}, (argv) => {
    console.log('this command will be run by default')
  })
```

如果运行`./my-cli.js --x=22`，将执行上面定义的命令将被执行。

默认命令也可以用作命令别名，如下所示：

```js
const argv = require('yargs')
  .command(['serve', '$0'], 'the serve command', () => {}, (argv) => {
    console.log('this command will be run by default')
  })
```

如果程序运行`./my-cli.js --x=22`或`./my-cli.js serve --x=22`，则将执行上面定义的命令将被之心。

#### 位置参数

命令可以接受*可选*和*必需的*位置参数。必需的位置参数采用表单`<foo>`，可选参数采用表单`[bar]`。解析的位置参数将填充在 `argv`属性中：

```js
yargs.command('get <source> [proxy]', 'make a get HTTP request')
  .help()
  .argv
```

#### 位置参数别名

可以使用该`|`字符为位置参数提供别名。例如，假设我们的应用程序允许username*或* email作为第一个参数：

```js
yargs.command('get <username|email> [password]', 'fetch a user by username or email.')
  .help()
  .argv
```

以这种方式，在命令执行时`argv.username`和`argv.email`都将被填充。

##### 可选的位置参数

最后一个位置参数可以选择接受一个值数组，方法是使用`..`运算符：

```js
yargs.command('download <url> [files..]', 'download several files')
  .help()
  .argv
```

##### 位置参数的帮助信息

您可以在命令构造器函数中使用[`.positional()`](https://github.com/yargs/yargs/blob/master/docs/api.md#positionalkey-opt)方法来描述和配置位置参数：

```js
yargs.command('get <source> [proxy]', 'make a get HTTP request', (yargs) => {
  yargs.positional('source', {
    describe: 'URL to fetch content from',
    type: 'string',
    default: 'http://www.google.com'
  }).positional('proxy', {
    describe: 'optional proxy URL'
  })
})
.help()
.argv
```

#### 命令执行

当在命令行上给出命令时，yargs将执行以下动作：

1. 将命令推入当前上下文
2. 重置非全局配置
3. 如果给定了`builder`,则通过它来配置命令
4. 从命令行解析并验证参数，包括位置参数
5. 如果验证成功，则运行`handler`函数（如果给定）
6. 从当前上下文中弹出命令

#### 命令别名

您可以通过将命令及其所有别名放入数组来为命令定义别名。

或者，一个命令模块可以指定`aliases`属性，该属性可以是字符串或字符串数组。通过`command`属性和`aliases`属性定义的所有别名将连接在一起。

数组中的第一个元素被认为是规范命令，它可以定义位置参数，数组中的其余元素被视为别名。别名从规范命令继承位置参数，因此将忽略别名中定义的任何位置参数。

如果在命令行上给出了规范命令或其任何别名，则将执行该命令。

```js
#!/usr/bin/env node
require('yargs')
  .command(['start [app]', 'run', 'up'], 'Start up an app', {}, (argv) => {
    console.log('starting up the', argv.app || 'default', 'app')
  })
  .command({
    command: 'configure <key> [value]',
    aliases: ['config', 'cfg'],
    desc: 'Set a config variable',
    builder: (yargs) => yargs.default('value', 'true'),
    handler: (argv) => {
      console.log(`setting ${argv.key} to ${argv.value}`)
    }
  })
  .demandCommand()
  .help()
  .wrap(72)
  .argv
```

```
$ ./svc.js help
Commands:
  start [app]              Start up an app            [aliases: run, up]
  configure <key> [value]  Set a config variable  [aliases: config, cfg]

Options:
  --help  Show help                                            [boolean]

$ ./svc.js cfg concurrency 4
setting concurrency to 4

$ ./svc.js run web
starting up the web app
```

#### 提供命令模块

对于复杂的命令，您可以将逻辑拉入模块。模块只需要导出：

* `exports.command`: 在命令行上给出字符串（或字符串数组）时执行此命令，第一个字符串可能包含位置参数
* `exports.aliases`:  表示别名的字符串数组（或单个字符串），别名中exports.command定义的位置参数将被忽略
* `exports.describe`:  用作帮助文本中命令的描述的字符串，`false`用于隐藏命令
* `exports.builder`:  一个声明命令接受的选项的对象，或者接受和返回yargs实例的函数
* `exports.handler`: a function which will be passed the parsed argv.

```js
// my-module.js
exports.command = 'get <source> [proxy]'

exports.describe = 'make a get HTTP request'

exports.builder = {
  banana: {
    default: 'cool'
  },
  batman: {
    default: 'sad'
  }
}

exports.handler = function (argv) {
  // do something with argv.
}
```

然后注册模块如下：

```js
yargs.command(require('my-module'))
  .help()
  .argv
```

或者，如果该模块不导出`command`和`describe`（或如果你只是想重写它们）：

```js
yargs.command('get <source> [proxy]', 'make a get HTTP request', require('my-module'))
  .help()
  .argv
```

##### 测试命令模块

如果你想完整地测试一个命令，你可以像这样测试它：

```js
it("returns help output", async () => {
  // Initialize parser using the command module
  const parser = yargs.command(require('./my-command-module')).help();

  // Run the command module with --help as argument
  const output = await new Promise((resolve) => {
    parser.parse("--help", (err, argv, output) => {
      resolve(output);
    })
  });

  // Verify the output is correct
  expect(output).toBe(expect.stringContaining("helpful message"));
});
```

此示例使用[jest](https://github.com/facebook/jest)作为测试运行器，但该概念独立于框架。

### .commandDir(directory, [opts])

从一个模块的相对目录来应用命令模块的时候调用此方法。

这允许您将多个命令组织到单个目录下的自己的模块中，并同时应用所有这些命令而不是多次调用 `.command(require('./dir/module'))`。

默认情况下，它会忽略子目录。这样您就可以使用目录结构来表示命令层次结构，其中每个命令在其构建器函数中使用此方法来应用其子命令。请参阅下面的示例。

请注意，yargs假设给定目录中的所有模块都是命令模块，如果遇到非命令模块，则会出错。在这种情况下，您可以将模块移动到其他目录，也可以使用`exclude`或 `visit`选项手动将其过滤掉。更多相关内容如下。

`directory` 是一个字符串类型的相对目录路径（必需）。

`opts`是一个选项对象（可选）。仅对以下选项有效：

- `recurse`: 布尔值，默认值 `false`

    在所有子目录中查找命令模块，并将它们应用为扁平化（非分层）列表。
    
- `extensions`: 字符串或数组，默认 `['js']`

    需要命令模块时要查找的文件类型。

- `visit`: 函数

    A synchronous function called for each command module encountered. Accepts
    `commandObject`, `pathToFile`, and `filename` as arguments. Returns
    `commandObject` to include the command; any ji to exclude/skip it.

    每个命令模块都会调用的同步函数。接受 `commandObject`，`pathToFile`和`filename`作为参数。返回包含命令的`commandObject`对象; 使用任何虚拟值来排除或跳过它。

- `include`: RegExp或函数

    将某些模块列入白名单。有关详细信息，请参阅[`require-directory`白名单](https://www.npmjs.com/package/require-directory#whitelisting)。

- `exclude`: RegExp or function

    将某些模块列入黑名单。有关详细信息，请参阅[`require-directory`黑名单](https://www.npmjs.com/package/require-directory#blacklisting)。

#### 使用示例命令层次结构 `.commandDir()`

预期实现的 CLI:

```sh
$ myapp --help
$ myapp init
$ myapp remote --help
$ myapp remote add base http://yargs.js.org
$ myapp remote prune base
$ myapp remote prune base fork whatever
```

目录结构:

```
myapp/
├─ cli.js
└─ cmds/
   ├─ init.js
   ├─ remote.js
   └─ remote_cmds/
      ├─ add.js
      └─ prune.js
```

cli.js:

```js
#!/usr/bin/env node
require('yargs')
  .commandDir('cmds')
  .demandCommand()
  .help()
  .argv
```

cmds/init.js:

```js
exports.command = 'init [dir]'
exports.desc = 'Create an empty repo'
exports.builder = {
  dir: {
    default: '.'
  }
}
exports.handler = function (argv) {
  console.log('init called for dir', argv.dir)
}
```

cmds/remote.js:

```js
exports.command = 'remote <command>'
exports.desc = 'Manage set of tracked repos'
exports.builder = function (yargs) {
  return yargs.commandDir('remote_cmds')
}
exports.handler = function (argv) {}
```

cmds/remote_cmds/add.js:

```js
exports.command = 'add <name> <url>'
exports.desc = 'Add remote named <name> for repo at url <url>'
exports.builder = {}
exports.handler = function (argv) {
  console.log('adding remote %s at url %s', argv.name, argv.url)
}
```

cmds/remote_cmds/prune.js:

```js
exports.command = 'prune <name> [names..]'
exports.desc = 'Delete tracked branches gone stale for remotes'
exports.builder = {}
exports.handler = function (argv) {
  console.log('pruning remotes %s', [].concat(argv.name).concat(argv.names).join(', '))
}
```

<a name="configuration"></a>

### 构建可配置的CLI应用程序

yargs的目标之一是检索JavaScript CLI社区中常见的实践，并使这些易于使用的约定应用于您自己的应用程序。

已经出现的一组有用的约定是关于应用程序如何允许用户扩展和定制其功能。

#### .rc 文件

一些命令库（例如，[Babel](https://babeljs.io/docs/usage/babelrc/)，[ESLint](https://github.com/eslint/eslint#configuration)）允许您通过填充`.rc`文件来提供配置是很常见的。

Yargs的 [`config()`](https://github.com/yargs/yargs/blob/master/docs/api.md#config)与模块[查找](https://www.npmjs.com/package/find-up)相结合，可以轻松实现`.rc`功能：

```js
const findUp = require('find-up')
const fs = require('fs')
const configPath = findUp.sync(['.myapprc', '.myapprc.json'])
const config = configPath ? JSON.parse(fs.readFileSync(configPath)) : {}
const argv = require('yargs')
  .config(config)
  .argv
```

#### 在package.json中提供配置

另一种常见做法是允许用户通过package.json中的保留字段提供配置。例如，分别使用`nyc`和`babel`键来配置 [nyc](https://github.com/istanbuljs/nyc#configuring-nyc) 或 [babel](https://babeljs.io/docs/usage/babelrc/#lookup-behavior)：

```json
{
  "nyc": {
    "watermarks": {
      "lines": [80, 95],
      "functions": [80, 95],
      "branches": [80, 95],
      "statements": [80, 95]
    }
  }
}
```

Yargs使用下面的[`pkgConf()`](https://github.com/yargs/yargs/blob/master/docs/api.md#config) 方法为您提供此功能：

```js
const argv = require('yargs')
  .pkgConf('nyc')
  .argv
```

#### 创建插件架构

[`pkgConf()`](https://github.com/yargs/yargs/blob/master/docs/api.md#config)和[`config()`](https://github.com/yargs/yargs/blob/master/docs/api.md#config)都支持`extends`关键字。`extends`允许您从[其他npm模块](https://www.npmjs.com/package/@istanbuljs/nyc-config-babel)继承配置，从而可以构建类似于[Babel presets](https://babeljs.io/docs/plugins/#presets)这样的插件架构：

```json
{
  "nyc": {
    "extends": "@istanbuljs/nyc-config-babel"
  }
}
```

<a name="customizing"></a>

#### 定制Yargs的解析器

不是每个人都同意`process.argv`的解析方式; 使用[`parserConfiguration()`](https://github.com/yargs/yargs/blob/master/docs/api.md#parserConfiguration)方法可以打开和关闭某些yargs的解析功能：

```js
yargs.parserConfiguration({
  "yargs": {
    "short-option-groups": true,
    "camel-case-expansion": true,
    "dot-notation": true,
    "parse-numbers": true,
    "boolean-negation": true
  }
})
```

有关此功能的详细文档，请参阅[yargs-parser](https://github.com/yargs/yargs-parser#configuration)模块。

### 中间件

有时您可能希望在参数到达命令处理程序之前对其进行转换。例如，您可能希望验证是否已提供凭据，否则从文件加载凭据。

中间件只是一堆函数，每个函数都传递当前解析的参数，然后可以通过添加值，删除值或覆盖值来更新。

Diagram:

```
                        --------------         --------------        ---------
stdin ----> argv ----> | Middleware 1 | ----> | Middleware 2 | ---> | Command |
                        --------------         --------------        ---------
```

#### 凭据中间件示例

在这个例子中，我们的中间件将检查`username`和`password`的参数值。如果没有，它将加载`~/.credentials`，并填充`argv.username`和`argv.password`值。

##### 中间件函数

```
const normalizeCredentials = (argv) => {
  if (!argv.username || !argv.password) {
    const credentials = JSON.parse(fs.readSync('~/.credentials'))
    return credentials
  }
  return {}
}

// Add normalizeCredentials to yargs
yargs.middleware(normalizeCredentials)
```

#### 异步凭据中间件示例

这个例子完全相同，但它异步加载`username`和`password`。

##### 中间件函数

```
const { promisify } = require('util') // since node 8.0.0
const readFile = promisify(require('fs').readFile)

const normalizeCredentials = (argv) => {
  if (!argv.username || !argv.password) {
    return readFile('~/.credentials').then(data => JSON.parse(data))
  }
  return {}
}

// Add normalizeCredentials to yargs
yargs.middleware(normalizeCredentials)
```

##### yargs解析配置

```
var argv = require('yargs')
  .usage('Usage: $0 <command> [options]')
  .command('login', 'Authenticate user', (yargs) =>{
        return yargs.option('username')
                    .option('password')
      } ,(argv) => {
        authenticateUser(argv.username, argv.password)
      },
      [normalizeCredentials]
     )
  .argv;
```

#### 使用非单例接口

要使yargs不作为单例运行，请执行以下操作：
```
const argv = require('yargs/yargs')(process.argv.slice(2))
```

当在库中使用yargs时，这尤其有用，因为第三方库不应该污染全局状态。

## Yargs示例

有关Yargs的更多演示，请参阅[示例文件夹](https://github.com/yargs/yargs/blob/master/example)。

### 选项只是一个哈希值！

plunder.js:

```javascript
#!/usr/bin/env node
var argv = require('yargs').argv;

if (argv.ships > 3 && argv.distance < 53.5) {
    console.log('Plunder more riffiwobbles!');
} else {
    console.log('Retreat from the xupptumblers!');
}
```

------

```
$ ./plunder.js --ships=4 --distance=22
Plunder more riffiwobbles!

$ ./plunder.js --ships 12 --distance 98.7
Retreat from the xupptumblers!
```

### 你可以设置一些简短的选项：

short.js:

```javascript
#!/usr/bin/env node
var argv = require('yargs').argv;
console.log('(%d,%d)', argv.x, argv.y);
```

------

```
$ ./short.js -x 10 -y 21
(10,21)
```

### 布尔值，长，短，甚至分组：

bool.js:

```javascript
#!/usr/bin/env node
var argv = require('yargs').argv;

if (argv.s) {
    process.stdout.write(argv.fr ? 'Le perroquet dit: ' : 'The parrot says: ');
}
console.log(
    (argv.fr ? 'couac' : 'squawk') + (argv.p ? '!' : '')
);
```

------

```
$ ./bool.js -s
The parrot says: squawk

$ ./bool.js -sp
The parrot says: squawk!

$ ./bool.js -sp --fr
Le perroquet dit: couac!
```

### 还有非连字符选项！只要使用`argv._`！

nonopt.js:

```javascript
#!/usr/bin/env node
var argv = require('yargs').argv;
console.log('(%d,%d)', argv.x, argv.y);
console.log(argv._);
```

------

```
$ ./nonopt.js -x 6.82 -y 3.35 rum
(6.82,3.35)
[ 'rum' ]

$ ./nonopt.js "me hearties" -x 0.54 yo -y 1.12 ho
(0.54,1.12)
[ 'me hearties', 'yo', 'ho' ]
```

### Yargs使用布尔值

count.js:

```javascript
#!/usr/bin/env node
var argv = require('yargs')
    .count('verbose')
    .alias('v', 'verbose')
    .argv;

VERBOSE_LEVEL = argv.verbose;

function WARN()  { VERBOSE_LEVEL >= 0 && console.log.apply(console, arguments); }
function INFO()  { VERBOSE_LEVEL >= 1 && console.log.apply(console, arguments); }
function DEBUG() { VERBOSE_LEVEL >= 2 && console.log.apply(console, arguments); }

WARN("Showing only important stuff");
INFO("Showing semi-important stuff too");
DEBUG("Extra chatty mode");
```

------

```
$ node count.js
Showing only important stuff

$ node count.js -v
Showing only important stuff
Showing semi-important stuff too

$ node count.js -vv
Showing only important stuff
Showing semi-important stuff too
Extra chatty mode

$ node count.js -v --verbose
Showing only important stuff
Showing semi-important stuff too
Extra chatty mode
```

### 告诉用户如何使用您的选项并设置要求。

area.js:

```javascript
#!/usr/bin/env node
var argv = require('yargs')
    .usage('Usage: $0 -w [num] -h [num]')
    .demandOption(['w','h'])
    .argv;

console.log("The area is:", argv.w * argv.h);
```

------

```
$ ./area.js -w 55 -h 11
The area is: 605

$ node ./area.js -w 4.91 -w 2.51
Usage: area.js -w [num] -h [num]

Options:
  -w  [required]
  -h  [required]

Missing required arguments: h
```

### 符合要求后，需求更多！请求非连字符的参数！

demand_count.js:

```javascript
#!/usr/bin/env node
var argv = require('yargs')
    .demandCommand(2)
    .argv;
console.dir(argv);
```

------

```
$ ./demand_count.js a

Not enough non-option arguments: got 1, need at least 2

$ ./demand_count.js a b
{ _: [ 'a', 'b' ], '$0': 'demand_count.js' }

$ ./demand_count.js a b c
{ _: [ 'a', 'b', 'c' ], '$0': 'demand_count.js' }
```

### 甚至更多的TIMBERS！

default_singles.js:

```javascript
#!/usr/bin/env node
var argv = require('yargs')
    .default('x', 10)
    .default('y', 10)
    .argv
;
console.log(argv.x + argv.y);
```

------

```
$ ./default_singles.js -x 5
15
```

default_hash.js:

```javascript
#!/usr/bin/env node
var argv = require('yargs')
    .default({ x : 10, y : 10 })
    .argv
;
console.log(argv.x + argv.y);
```

------

```
$ ./default_hash.js -y 7
17
```

### 如果你真的想得到所有的描述...

boolean_single.js:

```javascript
#!/usr/bin/env node
var argv = require('yargs')
    .boolean('v')
    .argv
;
console.dir(argv.v);
console.dir(argv._);
```

------

```
$ ./boolean_single.js -v "me hearties" yo ho
true
[ 'me hearties', 'yo', 'ho' ]
```

boolean_double.js:

```javascript
#!/usr/bin/env node
var argv = require('yargs')
    .boolean(['x','y','z'])
    .argv
;
console.dir([ argv.x, argv.y, argv.z ]);
console.dir(argv._);
```

------

```
$ ./boolean_double.js -x -z one two three
[ true, false, true ]
[ 'one', 'two', 'three' ]
```

### Yargs在这里帮助你......

您可以描述帮助消息的参数并设置别名。Yargs知道如何自动格式化一个方便的帮助字符串。

line_count.js:

```javascript
#!/usr/bin/env node
var argv = require('yargs')
    .usage('Usage: $0 <command> [options]')
    .command('count', 'Count the lines in a file')
    .example('$0 count -f foo.js', 'count the lines in the given file')
    .alias('f', 'file')
    .nargs('f', 1)
    .describe('f', 'Load a file')
    .demandOption(['f'])
    .help('h')
    .alias('h', 'help')
    .epilog('copyright 2019')
    .argv;

var fs = require('fs');
var s = fs.createReadStream(argv.file);

var lines = 0;
s.on('data', function (buf) {
    lines += buf.toString().match(/\n/g).length;
});

s.on('end', function () {
    console.log(lines);
});
```

------

```
$ node line_count.js 
Usage: line_count.js <command> [options]

Commands:
  line_count.js count  Count the lines in a file

Options:
  --version   Show version number      [boolean]
  -f, --file  Load a file             [required]
  -h, --help  Show help                [boolean]

Examples:
  line_count.js count -f foo.js  count the lines in the given file

copyright 2019

Missing required argument: f

$ node line_count.js count
line_count.js count

Count the lines in a file

Options:
  --version   Show version number      [boolean]
  -f, --file  Load a file             [required]
  -h, --help  Show help                [boolean]

Missing required argument: f

$ node line_count.js count --file line_count.js
25

$ node line_count.js count -f line_count.js
25
```

