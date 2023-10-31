## 关于

将大型代码库分成单独的独立版本的packages对于代码共享非常有用。但是，跨许多仓库进行更改很麻烦且难以跟踪，并且跨仓库的测试变得非常复杂。

为了解决这些（以及许多其他）问题，一些项目会将其代码库组织到单个的多packages仓库中（有时称为[monorepos](https://github.com/babel/babel/blob/master/doc/design/monorepo.md)）。比如像Babel，React，Angular，Ember，Meteor，Jest等以及许多其他项目都选择把所有代码包放在一个仓库中进行开发。

Lerna就是一种用于优化使用git和npm管理多应用包仓库工作流程的工具。

Lerna还可以减少开发和构建环境中复制大量的重复npm依赖包的时间和空间，这通常是将项目分成许多单独的NPM依赖包的缺点。有关详细信息，请参见  [hoist documentation](https://github.com/lerna/lerna/blob/master/doc/hoist.md)。

### Lerna项目的结构是怎样的?

实际上非常轻量。您的文件结构如下所示：

```shell
my-lerna-repo/
  package.json
  packages/
    package-1/
      package.json
    package-2/
      package.json
```

### Lerna可以做什么？

`bootstrap`将连接仓库中的依赖。`publish`用于发布任何有更新的包。

### Lerna不能做什么？

Lerna并不是 serverless monorepos的部署工具。Hoisting可能与传统的serverless monorepo部署技术不兼容。

## 入门

> 以下说明适用于Lerna3.x。对于新的Lerna项目，建议使用它而不是2.x。

首先，使用[npm](https://www.npmjs.com/)将Lerna安装为项目的开发依赖。

```shell
$ mkdir lerna-repo &&  cd  $_ 
$ npx lerna init
```

这将创建一个`lerna.json`配置文件以及一个`packages`文件夹，因此您的文件夹现在应如下所示：

```shell
lerna-repo/
  packages/
  package.json
  lerna.json
```

## 如何运行

Lerna允许您使用以下两种模式之一来管理项目：固定或独立。

### 固定/锁定模式（默认）

> 译者注：这种模式适用于多个目录模块属于同一个仓库的情形，比如一个React/Vue组件库

固定模式的Lerna项目的所有包在单个版本库上操作。版本号通过项目根目录下`lerna.json`文件中`version`字段配置。当您运行时`lerna publish`，如果某个模块自上次发布以来已被更新，它将被更新为您要发布的新版本。这意味着您仅在需要时才发布packages的新版本。

这是[Babel](https://github.com/babel/babel)当前使用的模式。如果要自动将所有packages版本捆绑在一起，请使用此选项。这种方法的一个问题是，对任何packages进行重大更改都会导致所有packages都具有新的主要版本。

### 独立模式

> 译者注：这种模式比较适用于一个包含前后端以及多端同构的应用，比如koa+react admin+taro小程序...

```
lerna init --independent
```

独立模式Lerna项目允许维护者彼此独立地增加packages的版本。每次发布时，都会提示您已更改的每个packages，以指定是补丁，次要，主要还是自定义更改。

独立模式使您可以更具体地更新每个packages的版本，并使一组组件变得有意义。将该模式与[语义版本](https://github.com/semantic-release/semantic-release)类的东西相结合来解决痛点。（这个任务已经在[atlassian / lerna-semantic-release](https://github.com/atlassian/lerna-semantic-release)这个仓库上完成）。

> 将`lerna.json`中的`version`字段设置为`independent`，以确保独立模式运行。

## 故障排除

如果您在使用Lerna时遇到任何问题，请查阅我们的[故障排除](https://github.com/lerna/lerna/blob/master/doc/troubleshooting.md)  文档，在这里您可以找到问题的答案。

## 经常问的问题

见 [FAQ.md](https://github.com/lerna/lerna/blob/master/FAQ.md).

## 概念

当Lerna 在运行命令遇到错误时，它将会记录到`lerna-debug.log`文件（与`npm-debug.log`类似）。

Lerna还支持 [scoped packages](https://docs.npmjs.com/misc/scope)。

运行`lerna --help`以查看所有可用的命令和选项。

### lerna.json

```json
{
  "version": "1.1.3",
  "npmClient": "npm",
  "command": {
    "publish": {
      "ignoreChanges": ["ignored-file", "*.md"],
      "message": "chore(release): publish",
      "registry": "https://npm.pkg.github.com"
    },
    "bootstrap": {
      "ignore": "component-*",
      "npmClientArgs": ["--no-package-lock"]
    }
  },
  "packages": ["packages/*"]
}
```

- `version`： 当前仓库的版本。
- `npmClient`：指定运行命令的客户端 (也可以为每个命令指定). 如果想使用yarn来运行所有命令则改为 `"yarn"` 。默认为 "npm".
- `command.publish.ignoreChanges`：不会包含在 `lerna changed/publish`命令中的globs数组。使用此功能可以防止不必要的更改发布在新版本中，例如修正`README.md`错字。
- `command.publish.message`：发布更新版本时的自定义提交消息。有关更多详细信息，请参见[@ lerna / version](https://github.com/lerna/lerna/blob/master/commands/version#--message-msg)。
- `command.publish.registry`：使用它来设置要发布到的自定义registry url来替代默认的npmjs.org，如果需要身份认证，请确保您能通过认证。
- `command.bootstrap.ignore`：运行`lerna bootstrap`命令时不会被引导的glob数组。
- `command.bootstrap.npmClientArgs`：在运行 `lerna bootstrap`的时候，将会被作为参数直接传递给`npm install`的字符串数组。
- `command.bootstrap.scope`：指定在运行`lerna bootstrap`命令时将会引导的packages的globs数组。
- `packages`: 存放package位置的globs数组。

`lerna.json`中的packages配置是匹配到包含`package.json`文件的目录的globs列表，这个就是lerna识别“leaf” packages的方式（注意：根目录下的`package.json`用于管理整个仓库的dev依赖和脚本）。

默认情况下，lerna将packages列表初始化为`["packages/*"]`，但是您也可以使用其他目录，例如`["modules/*"]`或`["package1", "package2"]`。定义好的globs变量是相对于`lerna.json`文件所在目录的，该目录`lerna.json`通常是仓库的根目录。唯一的限制是您不能直接嵌套packages位置，但这也是“正常的” npm packages所共有的一个限制。

例如，`["packages/*", "src/**"]`匹配文件树：

```shell
packages/
├── foo-pkg
│   └── package.json
├── bar-pkg
│   └── package.json
├── baz-pkg
│   └── package.json
└── qux-pkg
    └── package.json
src/
├── admin
│   ├── my-app
│   │   └── package.json
│   ├── stuff
│   │   └── package.json
│   └── things
│       └── package.json
├── profile
│   └── more-things
│       └── package.json
├── property
│   ├── more-stuff
│   │   └── package.json
│   └── other-things
│       └── package.json
└── upload
    └── other-stuff
        └── package.json
```

将leaf packages放在`packages/*`下被认为是“最佳实践”，但不是使用Lerna的要求。

### 共享的 `devDependencies`

大多数`devDependencies`可以通过`lerna link convert`命令推送到Lerna仓库的根目录

上面的命令将自动吊装并使用相对目录的`file:`说明符。

吊装有一些好处：

- 所有软件包都使用给定依赖项的相同版本
- 可以通过自动化工具（例如[GreenKeeper）](https://greenkeeper.io/)使根目录的依赖关系保持最新
- 依赖包安装时间减少
- 需要更少的存储空间

请注意，`devDependencies`仍然需要将npm脚本使用的“二进制”可执行文件直接安装在使用它们的每个软件包中。

请注意，`devDependencies`依赖包中如果有被npm scripts使用的”二进制“可执行文件的话，则仍然需要在需要它们的包中各自安装这些依赖。

例如，在以下场景下`nsp`依赖对于`lerna run nsp` 的正常运行来说是必需的（`npm run nsp`在包目录中）。

```json
{
  "scripts": {
    "nsp": "nsp"
  },
  "devDependencies": {
    "nsp": "^2.3.3"
  }
}
```

### Git主机的依赖项

Lerna允许将本地独立包的目标版本写成`committish`格式的[git remote url](https://docs.npmjs.com/cli/install)，而不仅仅是普通的数字版本范围。当包必须是私有的并且[不使用私有的npm registry](https://www.dotconferences.com/2016/05/fabien-potencier-monolithic-repositories-vs-many-repositories)时，这允许包通过git仓库获取。`committish``#v1.0.0``#semver:^1.0.0`

请注意，lerna并*没有*执行把git history实际分离到独立的只读存储库。这是仓库管理者的责任。（有关实现的详细信息，请参[见此评论](https://github.com/lerna/lerna/pull/1033#issuecomment-335894690)）

```json
// packages/pkg-1/package.json
{
  name: "pkg-1",
  version: "1.0.0",
  dependencies: {
    "pkg-2": "github:example-user/pkg-2#v1.0.0"
  }
}

// packages/pkg-2/package.json
{
  name: "pkg-2",
  version: "1.0.0"
}
```

在上面的示例中，

- `lerna bootstrap`将正确链接`pkg-2`到`pkg-1`。
- `lerna publishd`当`pkg-2`更改时，将会在`pkg-1`中更新committish(`#v1.0.0`)