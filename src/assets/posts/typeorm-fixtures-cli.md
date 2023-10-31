依赖于[faker.js](https://github.com/marak/Faker.js/)，typeorm-fixtures-cli允许您在开发或测试项目时创建大量的数据填充/假数据。它为您提供了一些基本工具，使您可以轻松地以编写用于生成复杂数据的易于读写的规则，以便团队中的每个人都可以根据需要生成自己的测试数据。

## 安装

#### NPM

```bash
npm install typeorm-fixtures-cli --save-dev
```

#### Yarn

```bash
yarn add typeorm-fixtures-cli --dev
```

## 开发步骤

```bash
# 安装依赖
npm install

# 构建编译文件
npm run build
```

## 示例

`fixtures/Comment.yml`

```yaml
entity: Comment
items:
  comment{1..10}:
    fullName: '{{name.firstName}} {{name.lastName}}'
    email: '{{internet.email}}'
    text: '{{lorem.paragraphs}}'
    post: '@post*'
```

`fixtures/Post.yml`

```yaml
entity: Post
items:
  post1:
    title: '{{name.title}}'
    description: '{{lorem.paragraphs}}'
    user: '@user($current)'
  post2:
    title: '{{name.title}}'
    description: '{{lorem.paragraphs}}'
    user: '@user($current)'
```

`fixtures/User.yml`

```yaml
entity: User
items:
  user1:
    firstName: '{{name.firstName}}'
    lastName: '{{name.lastName}}'
    email: '{{internet.email}}'
    profile: '@profile1'
    __call:
      setPassword:
        - foo
  user2:
    firstName: '{{name.firstName}}'
    lastName: '{{name.lastName}}'
    email: '{{internet.email}}'
    profile: '@profile2'
    __call:
      setPassword:
        - foo
```

`fixtures/Profile.yml`

```yaml
entity: Profile
items:
  profile1:
    aboutMe: <%= ['about string', 'about string 2', 'about string 3'].join(", ") %>
    skype: skype-account>
    language: english
  profile2:
    aboutMe: <%= ['about string', 'about string 2', 'about string 3'].join(", ") %>
    skype: skype-account
    language: english
```

## 创建填充

此库的最基本功能是将扁平的yaml文件转换为对象

```yaml
entity: User
items:
  user0:
    username: bob
    fullname: Bob
    birthDate: 1980-10-10
    email: bob@example.org
    favoriteNumber: 42

  user1:
    username: alice
    fullname: Alice
    birthDate: 1978-07-12
    email: alice@example.org
    favoriteNumber: 27
```

### Fixture范围

第一步是创建一个对象的多个副本，以便从yaml文件中删除重复的规则。

您可以通过在fixture名称中定义范围来实现：

```yaml
entity: User
items:
  user{1..10}:
    username: bob
    fullname: Bob
    birthDate: 1980-10-10
    email: bob@example.org
    favoriteNumber: 42
```

现在它将生成十个用户，ID为user1到user10。相当不错，但我们只有10条相同的名字，用户名和电子邮件的数据，这还不是很花哨。

### Fixture引用

您还可以指定对先前创建的fixture列表的引用：

```yaml
entity: Post
items:
  post1:
    title: 'Post title'
    description: 'Post description'
    user: '@user1'
```

### Fixture列表

您也可以指定值列表而不是范围：

```yaml
entity: Post
items:
  post{1..10}:
    title: 'Post title'
    description: 'Post description'
    user: '@user($current)'
```

在一个设置了范围的案例中（例如，用户{1..10}），`($current)`将为user1返回1，为user2返回2。。。

current在迭代中也可以用作字符串值：

```yaml
entity: Post
items:
  post{1..10}:
    title: 'Post($current)'
    description: 'Post description'
```

``Post($current)` 将返回Post1为post1，Post2为post2。。。

您可以使用基本数学运算符来改变此输出：

```yaml
entity: Post
items:
  post{1..10}:
    title: 'Post($current*100)'
    description: 'Post description'
```

``Post($current*100)` 将返回post100 for post1，Post200 for post2。。。

### 调用方法

有时如果你想要调用一个方法来初始化更多数据，你可以像使用属性一样执行此操作，使用方法名称并为其提供一组参数。

```yaml
entity: User
items:
  user{1..10}:
    username: bob
    fullname: Bob
    birthDate: 1980-10-10
    email: bob@example.org
    favoriteNumber: 42
    _call:
      setPassword:
        - foo
```

## 处理关联

```yaml
entity: User
items:
  user1:
    # ...

entity: Group
items:
  group1:
    name: '<{names.admin}>'
    owner: '@user1'
    members:
      - '@user2'
      - '@user3'

```

如果要创建10个user和10个group并让每个用户拥有一个组，则可以在使用fixture ranges时,使用`($current)`将其替换为每次迭代的当前ID：

```yaml
entity: User
items:
  user1:
    # ...

entity: Group
items:
  group{1..10}:
    name: 'name'
    owner: '@user($current)'
    members:
      - '@user2'
      - '@user3'

```

如果您想要一个随机用户而不是一个固定用户，您可以使用通配符定义一个引用：

```yaml
entity: User
items:
  user1:
    # ...

entity: Group
items:
  group{1..10}:
    name: 'name'
    owner: '@user*'
    members:
      - '@user2'
      - '@user3'

```

或者

```yaml
entity: User
items:
  user1:
    # ...

entity: Group
items:
  group{1..10}:
    name: 'name'
    owner: '@user{1..2}' # @user1 or @user2
    members:
      - '@user2'
      - '@user3'

```

## 高级指南

### Parameters

You can set global parameters that will be inserted everywhere those values are used to help with readability. For example:

```yaml
entity: Group
parameters:
  names:
    admin: Admin
items:
  group1:
    name: '<{names.admin}>' # <--- set Admin
    owner: '@user1'
    members:
      - '@user2'
      - '@user3'
```

### Faker数据

本库整合了[faker.js](https://github.com/marak/Faker.js/)库。使用{{foo}}，您可以调用Faker数据提供者来生成随机数据。

```yaml
entity: User
items:
  user{1..10}:
    username: '{{internet.userName}}'
    fullname: '{{name.firstName}} {{name.lastName}}'
    birthDate: '{{date.past}}'
    email: '{{internet.email}}'
    favoriteNumber: '{{random.number}}'
    _call:
      setPassword:
        - foo
```

### EJS模板

本库与[EJS](https://github.com/mde/ejs)整合

```yaml
entity: Profile
items:
  profile1:
    aboutMe: <%= ['about string', 'about string 2', 'about string 3'].join(", ") %>
    skype: skype-account>
    language: english
```

### 加载处理器

处理器允许您在持久化之前和(或)之后处理对象。处理器必须实现：`IProcessor`

```typescript
import { IProcessor } from 'typeorm-fixtures-cli';
```

下面是一个示例：

`processor/UserProcessor.ts`

```typescript
import { IProcessor } from 'typeorm-fixtures-cli';
import { User } from '../entity/User';

export default class UserProcessor implements IProcessor<User> {
  preProcess(name: string, object: any): any {
    return { ...object, firstName: 'foo' };
  }

  postProcess(name: string, object: { [key: string]: any }): void {
    object.name = `${object.firstName} ${object.lastName}`;
  }
}
```

fixture 配置 `fixtures/user.yml`

```yaml
entity: User
processor: ../processor/UserProcessor
items:
  user1:
    firstName: '{{name.firstName}}'
    lastName: '{{name.lastName}}'
    email: '{{internet.email}}'
```

## 用法

```
Usage: fixtures [options] <path> Fixtures folder/file path

Options:
  -v, --version              output the version number
  -c, --config <path>        TypeORM config path (default: "ormconfig.yml")
  --require                  A list of additional modules. e.g. ts-node/register
  -cn, --connection [value]  TypeORM connection name (default: "default")
  -s --sync                  Database schema sync
  -d --debug                 Enable debug
  -h, --help                 output usage information
  --no-color                 Disable color
```

##### 需要多个附加模块

如果您一次使用多个模块（例如ts-node和tsconfig-paths），则可以提供多个require参数。例如：

```
fixtures ./fixtures --config ./typeorm.config.ts --sync --require=ts-node/register --require=tsconfig-paths/register
```

### 以编程方式加载fixtures

虽然typeorm-fixtures-cli旨在用作CLI，但您仍然可以通过程序中的API加载fixture。

例如，下面的代码片段将加载`./fixtures`目录中存在的所有fixture ：

```typescript
import * as path from 'path';
import { Builder, fixturesIterator, Loader, Parser, Resolver } from 'typeorm-fixtures-cli/dist';
import { createConnection, getRepository } from 'typeorm';

const loadFixtures = async (fixturesPath: string) => {
  let connection;

  try {
    connection = await createConnection();
    await connection.synchronize(true);

    const loader = new Loader();
    loader.load(path.resolve(fixturesPath));

    const resolver = new Resolver();
    const fixtures = resolver.resolve(loader.fixtureConfigs);
    const builder = new Builder(connection, new Parser());

    for (const fixture of fixturesIterator(fixtures)) {
      const entity = await builder.build(fixture);
      await getRepository(entity.constructor.name).save(entity);
    }
  } catch (err) {
    throw err;
  } finally {
    if (connection) {
      await connection.close();
    }
  }
};

loadFixtures('./fixtures')
  .then(() => {
    console.log('Fixtures are successfully loaded.');
  })
  .catch(err => console.log(err));
```

## 简单示例

- [typeorm-fixtures-sample](https://github.com/RobinCK/typeorm-fixtures-sample)
