/* eslint-disable */
export default async () => {
    const t = {
        ["./modules/user/entities/access-token.entity"]: await import("./modules/user/entities/access-token.entity"),
        ["./modules/user/entities/user.entity"]: await import("./modules/user/entities/user.entity"),
        ["./modules/rbac/entities/role.entity"]: await import("./modules/rbac/entities/role.entity"),
        ["./modules/content/entities/post.entity"]: await import("./modules/content/entities/post.entity"),
        ["./modules/content/entities/comment.entity"]: await import("./modules/content/entities/comment.entity"),
        ["./modules/user/entities/refresh-token.entity"]: await import("./modules/user/entities/refresh-token.entity"),
        ["./modules/content/constants"]: await import("./modules/content/constants"),
        ["./modules/content/entities/category.entity"]: await import("./modules/content/entities/category.entity"),
        ["./modules/content/entities/tag.entity"]: await import("./modules/content/entities/tag.entity"),
        ["./modules/database/constants"]: await import("./modules/database/constants"),
        ["./modules/user/constants"]: await import("./modules/user/constants")
    };
    return { "@nestjs/swagger": { "models": [[import("./modules/user/entities/refresh-token.entity"), { "RefreshTokenEntity": { accessToken: { required: true, type: () => t["./modules/user/entities/access-token.entity"].AccessTokenEntity, description: "\u5173\u8054\u7684\u767B\u5F55\u4EE4\u724C" } } }], [import("./modules/rbac/entities/role.entity"), { "RoleEntity": { id: { required: true, type: () => String }, name: { required: true, type: () => String }, label: { required: false, type: () => String }, description: { required: false, type: () => String }, systemed: { required: false, type: () => Boolean }, deletedAt: { required: true, type: () => Date }, permissions: { required: true }, users: { required: true, type: () => [t["./modules/user/entities/user.entity"].UserEntity] } } }], [import("./modules/rbac/entities/permission.entity"), { "PermissionEntity": { id: { required: true, type: () => String }, name: { required: true, type: () => String }, label: { required: false, type: () => String }, description: { required: false, type: () => String }, rule: { required: true, type: () => Object }, roles: { required: true, type: () => [t["./modules/rbac/entities/role.entity"].RoleEntity] }, users: { required: true, type: () => [t["./modules/user/entities/user.entity"].UserEntity] } } }], [import("./modules/user/entities/user.entity"), { "UserEntity": { id: { required: true, type: () => String }, nickname: { required: false, type: () => String }, username: { required: true, type: () => String }, password: { required: true, type: () => String }, phone: { required: false, type: () => String }, email: { required: false, type: () => String }, createdAt: { required: true, type: () => Date }, updatedAt: { required: true, type: () => Date }, deletedAt: { required: true, type: () => Date }, accessTokens: { required: true, type: () => [t["./modules/user/entities/access-token.entity"].AccessTokenEntity] }, posts: { required: true, type: () => [t["./modules/content/entities/post.entity"].PostEntity] }, comments: { required: true, type: () => [t["./modules/content/entities/comment.entity"].CommentEntity] }, roles: { required: true, type: () => [t["./modules/rbac/entities/role.entity"].RoleEntity] }, permissions: { required: true } } }], [import("./modules/user/entities/access-token.entity"), { "AccessTokenEntity": { refreshToken: { required: true, type: () => t["./modules/user/entities/refresh-token.entity"].RefreshTokenEntity }, user: { required: true, type: () => t["./modules/user/entities/user.entity"].UserEntity } } }], [import("./modules/content/entities/comment.entity"), { "CommentEntity": { id: { required: true, type: () => String }, body: { required: true, type: () => String }, createdAt: { required: true, type: () => Date }, depth: { required: true, type: () => Object, default: 0 }, parent: { required: true, type: () => t["./modules/content/entities/comment.entity"].CommentEntity, nullable: true }, children: { required: true, type: () => [t["./modules/content/entities/comment.entity"].CommentEntity] }, post: { required: true, type: () => t["./modules/content/entities/post.entity"].PostEntity }, author: { required: true, type: () => t["./modules/user/entities/user.entity"].UserEntity } } }], [import("./modules/content/entities/tag.entity"), { "TagEntity": { id: { required: true, type: () => String }, name: { required: true, type: () => String }, description: { required: false, type: () => String }, deletedAt: { required: true, type: () => Date }, postCount: { required: true, type: () => Number, description: "\u901A\u8FC7queryBuilder\u751F\u6210\u7684\u6587\u7AE0\u6570\u91CF(\u865A\u62DF\u5B57\u6BB5)" }, posts: { required: true, type: () => [t["./modules/content/entities/post.entity"].PostEntity] } } }], [import("./modules/content/entities/post.entity"), { "PostEntity": { id: { required: true, type: () => String }, title: { required: true, type: () => String }, body: { required: true, type: () => String }, summary: { required: false, type: () => String }, keywords: { required: false, type: () => [String] }, type: { required: true, enum: t["./modules/content/constants"].PostBodyType }, publishedAt: { required: false, type: () => Date, nullable: true }, customOrder: { required: true, type: () => Number }, createdAt: { required: true, type: () => Date }, updatedAt: { required: true, type: () => Date }, deletedAt: { required: true, type: () => Date }, commentCount: { required: true, type: () => Number, description: "\u901A\u8FC7queryBuilder\u751F\u6210\u7684\u8BC4\u8BBA\u6570\u91CF(\u865A\u62DF\u5B57\u6BB5)" }, category: { required: true, type: () => t["./modules/content/entities/category.entity"].CategoryEntity }, tags: { required: true, type: () => [t["./modules/content/entities/tag.entity"].TagEntity] }, comments: { required: true, type: () => [t["./modules/content/entities/comment.entity"].CommentEntity] }, author: { required: true, type: () => t["./modules/user/entities/user.entity"].UserEntity } } }], [import("./modules/content/entities/category.entity"), { "CategoryEntity": { id: { required: true, type: () => String }, name: { required: true, type: () => String }, customOrder: { required: true, type: () => Number }, deletedAt: { required: true, type: () => Date }, depth: { required: true, type: () => Object, default: 0 }, parent: { required: true, type: () => t["./modules/content/entities/category.entity"].CategoryEntity, nullable: true }, children: { required: true, type: () => [t["./modules/content/entities/category.entity"].CategoryEntity] }, posts: { required: true, type: () => [t["./modules/content/entities/post.entity"].PostEntity] } } }], [import("./modules/restful/dtos/delete.dto"), { "DeleteDto": { ids: { required: true, type: () => [String], description: "\u5F85\u5220\u9664\u6570\u636E\u7684ID\u5217\u8868" } } }], [import("./modules/restful/dtos/delete-with-trash.dto"), { "DeleteWithTrashDto": { trash: { required: false, type: () => Boolean, description: "\u662F\u5426\u8F6F\u5220\u9664" } }, "RestoreDto": { ids: { required: true, type: () => [String], description: "\u5F85\u6062\u590D\u6570\u636E\u7684ID\u5217\u8868" } } }], [import("./modules/restful/dtos/paginate.dto"), { "PaginateDto": { page: { required: false, type: () => Number, description: "\u5F53\u524D\u9875", default: 1 }, limit: { required: false, type: () => Number, description: "\u6BCF\u9875\u6570\u636E\u91CF", default: 10 } } }], [import("./modules/restful/dtos/paginate-width-trashed.dto"), { "PaginateWithTrashedDto": { trashed: { required: false, description: "\u6839\u636E\u8F6F\u5220\u9664\u72B6\u6001\u67E5\u8BE2", enum: t["./modules/database/constants"].SelectTrashMode } } }], [import("./modules/user/dtos/common.dto"), { "UserCommonDto": { credential: { required: true, type: () => String, description: "\u767B\u5F55\u51ED\u8BC1:\u53EF\u4EE5\u662F\u7528\u6237\u540D,\u624B\u673A\u53F7,\u90AE\u7BB1\u5730\u5740" }, username: { required: true, type: () => String, description: "\u7528\u6237\u540D" }, nickname: { required: false, type: () => String, description: "\u6635\u79F0:\u4E0D\u8BBE\u7F6E\u5219\u4E3A\u7528\u6237\u540D" }, phone: { required: true, type: () => String, description: "\u624B\u673A\u53F7:\u5FC5\u987B\u662F\u533A\u57DF\u5F00\u5934\u7684,\u6BD4\u5982+86.15005255555" }, email: { required: true, type: () => String, description: "\u90AE\u7BB1\u5730\u5740:\u5FC5\u987B\u7B26\u5408\u90AE\u7BB1\u5730\u5740\u89C4\u5219" }, password: { required: true, type: () => String, description: "\u7528\u6237\u5BC6\u7801:\u5BC6\u7801\u5FC5\u987B\u7531\u5C0F\u5199\u5B57\u6BCD,\u5927\u5199\u5B57\u6BCD,\u6570\u5B57\u4EE5\u53CA\u7279\u6B8A\u5B57\u7B26\u7EC4\u6210" }, plainPassword: { required: true, type: () => String, description: "\u786E\u8BA4\u5BC6\u7801:\u5FC5\u987B\u4E0E\u7528\u6237\u5BC6\u7801\u8F93\u5165\u76F8\u540C\u7684\u5B57\u7B26\u4E32" } } }], [import("./modules/user/dtos/auth.dto"), { "CredentialDto": {}, "RegisterDto": {} }], [import("./modules/user/dtos/user.dto"), { "CreateUserDto": { roles: { required: false, type: () => [String], description: "\u7528\u6237\u5173\u8054\u7684\u89D2\u8272ID\u5217\u8868" }, permissions: { required: false, type: () => [String], description: "\u7528\u6237\u76F4\u63A5\u5173\u8054\u7684\u6743\u9650ID\u5217\u8868" } }, "UpdateUserDto": { id: { required: true, type: () => String, description: "\u5F85\u66F4\u65B0\u7684\u7528\u6237ID" } }, "QueryUserDto": { role: { required: false, type: () => String, description: "\u89D2\u8272ID:\u6839\u636E\u89D2\u8272\u6765\u8FC7\u6EE4\u7528\u6237" }, permission: { required: false, type: () => String, description: "\u6743\u9650ID:\u6839\u636E\u6743\u9650\u6765\u8FC7\u6EE4\u7528\u6237(\u6743\u9650\u5305\u542B\u7528\u6237\u5173\u8054\u7684\u6240\u6709\u89D2\u8272\u7684\u6743\u9650\u4EE5\u53CA\u76F4\u63A5\u5173\u8054\u7684\u6743\u9650)" }, orderBy: { required: false, description: "\u6392\u5E8F\u89C4\u5219:\u53EF\u6307\u5B9A\u7528\u6237\u5217\u8868\u7684\u6392\u5E8F\u89C4\u5219,\u9ED8\u8BA4\u4E3A\u6309\u521B\u5EFA\u65F6\u95F4\u964D\u5E8F\u6392\u5E8F", enum: t["./modules/user/constants"].UserOrderType } }, "QueryFrontendUserDto": {} }], [import("./modules/user/dtos/account.dto"), { "UpdateAccountDto": {}, "UpdatePasswordDto": { oldPassword: { required: true, type: () => String, description: "\u65E7\u5BC6\u7801:\u7528\u6237\u5728\u66F4\u6539\u5BC6\u7801\u65F6\u9700\u8981\u8F93\u5165\u7684\u539F\u5BC6\u7801" } } }], [import("./modules/rbac/dtos/role.dto"), { "QueryRoleDto": { user: { required: false, type: () => String } }, "CreateRoleDto": { name: { required: true, type: () => String, description: "\u6743\u9650\u540D\u79F0" }, label: { required: false, type: () => String, description: "\u6743\u9650\u6807\u8BC6:\u5982\u679C\u6CA1\u6709\u8BBE\u7F6E\u5219\u5728\u67E5\u8BE2\u540E\u4E3A\u6743\u9650\u540D\u79F0" }, permissions: { required: false, type: () => [String], description: "\u5173\u8054\u6743\u9650ID\u5217\u8868:\u4E00\u4E2A\u89D2\u8272\u53EF\u4EE5\u5173\u8054\u591A\u4E2A\u6743\u9650,\u4E00\u4E2A\u6743\u9650\u4E5F\u53EF\u4EE5\u5C5E\u4E8E\u591A\u4E2A\u89D2\u8272" } }, "UpdateRoleDto": { id: { required: true, type: () => String, description: "\u5F85\u66F4\u65B0\u7684\u89D2\u8272ID" } } }], [import("./modules/rbac/dtos/permission.dto"), { "QueryPermssionDto": { role: { required: false, type: () => String, description: "\u89D2\u8272ID:\u901A\u8FC7\u89D2\u8272\u8FC7\u6EE4\u6743\u9650\u5217\u8868" } } }], [import("./modules/content/dtos/category.dto"), { "QueryCategoryTreeDto": { trashed: { required: false, description: "\u6839\u636E\u8F6F\u5220\u9664\u72B6\u6001\u67E5\u8BE2", enum: t["./modules/database/constants"].SelectTrashMode } }, "CreateCategoryDto": { name: { required: true, type: () => String, description: "\u5206\u7C7B\u540D" }, parent: { required: false, type: () => String, description: "\u7236\u5206\u7C7BID" }, customOrder: { required: false, type: () => Number, description: "\u81EA\u5B9A\u4E49\u6392\u5E8F", default: 0 } }, "UpdateCategoryDto": { id: { required: true, type: () => String, description: "\u5F85\u66F4\u65B0ID" } } }], [import("./modules/content/dtos/post.dto"), { "QueryPostDto": { search: { required: false, type: () => String, description: "\u5168\u6587\u641C\u7D22" }, isPublished: { required: false, type: () => Boolean, description: "\u662F\u5426\u67E5\u8BE2\u5DF2\u53D1\u5E03(\u5168\u90E8\u6587\u7AE0:\u4E0D\u586B\u3001\u53EA\u67E5\u8BE2\u5DF2\u53D1\u5E03\u7684:true\u3001\u53EA\u67E5\u8BE2\u672A\u53D1\u5E03\u7684:false)" }, orderBy: { required: false, description: "\u67E5\u8BE2\u7ED3\u679C\u6392\u5E8F,\u4E0D\u586B\u5219\u7EFC\u5408\u6392\u5E8F", enum: t["./modules/content/constants"].PostOrderType }, category: { required: false, type: () => String, description: "\u6839\u636E\u5206\u7C7BID\u67E5\u8BE2\u6B64\u5206\u7C7B\u53CA\u5176\u540E\u4EE3\u5206\u7C7B\u4E0B\u7684\u6587\u7AE0" }, tag: { required: false, type: () => String, description: "\u6839\u636E\u6807\u7B7EID\u67E5\u8BE2" }, author: { required: false, type: () => String, description: "\u6839\u636E\u6587\u7AE0\u4F5C\u8005ID\u67E5\u8BE2" } }, "CreatePostDto": { title: { required: true, type: () => String, description: "\u6587\u7AE0\u6807\u9898" }, body: { required: true, type: () => String, description: "\u6587\u7AE0\u5185\u5BB9" }, summary: { required: false, type: () => String, description: "\u6587\u7AE0\u63CF\u8FF0" }, publishedAt: { required: false, type: () => Date, description: "\u662F\u5426\u53D1\u5E03(\u53D1\u5E03\u65F6\u95F4)" }, keywords: { required: false, type: () => [String], description: "SEO\u5173\u952E\u5B57" }, customOrder: { required: false, type: () => Number, description: "\u81EA\u5B9A\u4E49\u6392\u5E8F", default: 0 }, category: { required: true, type: () => String, description: "\u6240\u5C5E\u5206\u7C7BID" }, tags: { required: false, type: () => [String], description: "\u5173\u8054\u6807\u7B7EID" }, author: { required: false, type: () => String, description: "\u6587\u7AE0\u4F5C\u8005ID:\u53EF\u7528\u4E8E\u5728\u7BA1\u7406\u5458\u53D1\u5E03\u6587\u7AE0\u65F6\u5206\u914D\u7ED9\u5176\u5B83\u7528\u6237,\u5982\u679C\u4E0D\u8BBE\u7F6E,\u5219\u4F5C\u8005\u4E3A\u5F53\u524D\u7BA1\u7406\u5458" } }, "QueryFrontendPostDto": {}, "QueryOwnerPostDto": {}, "CreateUserPostDto": { userOrder: { required: false, type: () => Number, description: "\u7528\u6237\u4FA7\u6392\u5E8F:\u6587\u7AE0\u5728\u7528\u6237\u7684\u6587\u7AE0\u7BA1\u7406\u800C\u975E\u540E\u53F0\u4E2D,\u5217\u8868\u7684\u6392\u5E8F\u89C4\u5219", default: 0 } }, "UpdatePostDto": { id: { required: true, type: () => String, description: "\u5F85\u66F4\u65B0ID" } }, "UpdateUserPostDto": { userOrder: { required: false, type: () => Number, description: "\u7528\u6237\u4FA7\u6392\u5E8F:\u6587\u7AE0\u5728\u7528\u6237\u7684\u6587\u7AE0\u7BA1\u7406\u800C\u975E\u540E\u53F0\u4E2D,\u5217\u8868\u7684\u6392\u5E8F\u89C4\u5219", default: 0 } } }], [import("./modules/content/dtos/comment.dto"), { "QueryCommentDto": { author: { required: false, type: () => String, description: "\u6839\u636E\u4F20\u5165\u8BC4\u8BBA\u53D1\u5E03\u8005\u7684ID\u5BF9\u8BC4\u8BBA\u8FDB\u884C\u8FC7\u6EE4" }, post: { required: false, type: () => String, description: "\u6240\u5C5E\u6587\u7AE0ID" } }, "QueryCommentTreeDto": {}, "CreateCommentDto": { body: { required: true, type: () => String, description: "\u8BC4\u8BBA\u5185\u5BB9" }, post: { required: true, type: () => String, description: "\u6240\u5C5E\u6587\u7AE0ID" }, parent: { required: false, type: () => String, description: "\u4E0A\u7EA7\u8BC4\u8BBAID" } } }], [import("./modules/content/dtos/tag.dto"), { "CreateTagDto": { name: { required: true, type: () => String, description: "\u6807\u7B7E\u540D\u79F0" }, description: { required: false, type: () => String, description: "\u6807\u7B7E\u63CF\u8FF0" } }, "UpdateTagDto": { id: { required: true, type: () => String, description: "\u5F85\u66F4\u65B0ID" } } }]], "controllers": [[import("./modules/content/controllers/category.controller"), { "CategoryController": {} }], [import("./modules/content/controllers/tag.controller"), { "TagController": {} }], [import("./modules/content/controllers/post.controller"), { "PostController": {} }], [import("./modules/content/controllers/comment.controller"), { "CommentController": {} }], [import("./modules/rbac/controllers/permission.controller"), { "PermissionController": {} }], [import("./modules/rbac/controllers/role.controller"), { "RoleController": {} }], [import("./modules/user/controllers/auth.controller"), { "AuthController": {} }], [import("./modules/user/controllers/account.controller"), { "AccountController": {} }], [import("./modules/user/controllers/user.controller"), { "UserController": {} }]] } };
};