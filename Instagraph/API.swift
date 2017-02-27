//  This file was automatically generated and should not be edited.

import Apollo

public struct UpdatePostInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(title: String? = nil, id: GraphQLID, blobFieldName: String? = nil, clientMutationId: String? = nil) {
    graphQLMap = ["title": title, "id": id, "blobFieldName": blobFieldName, "clientMutationId": clientMutationId]
  }
}

public final class AllPostsQuery: GraphQLQuery {
  public static let operationDefinition =
    "query AllPosts {" +
    "  viewer {" +
    "    __typename" +
    "    allPosts(first: 10) {" +
    "      __typename" +
    "      edges {" +
    "        __typename" +
    "        cursor" +
    "        node {" +
    "          __typename" +
    "          id" +
    "          title" +
    "          blobUrl" +
    "          createdAt" +
    "        }" +
    "      }" +
    "    }" +
    "  }" +
    "}"
  public init() {
  }

  public struct Data: GraphQLMappable {
    public let viewer: Viewer?

    public init(reader: GraphQLResultReader) throws {
      viewer = try reader.optionalValue(for: Field(responseName: "viewer"))
    }

    public struct Viewer: GraphQLMappable {
      public let __typename: String
      public let allPosts: AllPost?

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))
        allPosts = try reader.optionalValue(for: Field(responseName: "allPosts", arguments: ["first": 10]))
      }

      public struct AllPost: GraphQLMappable {
        public let __typename: String
        public let edges: [Edge?]?

        public init(reader: GraphQLResultReader) throws {
          __typename = try reader.value(for: Field(responseName: "__typename"))
          edges = try reader.optionalList(for: Field(responseName: "edges"))
        }

        public struct Edge: GraphQLMappable {
          public let __typename: String
          public let cursor: String
          public let node: Node

          public init(reader: GraphQLResultReader) throws {
            __typename = try reader.value(for: Field(responseName: "__typename"))
            cursor = try reader.value(for: Field(responseName: "cursor"))
            node = try reader.value(for: Field(responseName: "node"))
          }

          public struct Node: GraphQLMappable {
            public let __typename: String
            public let id: GraphQLID
            public let title: String
            public let blobUrl: String?
            public let createdAt: String

            public init(reader: GraphQLResultReader) throws {
              __typename = try reader.value(for: Field(responseName: "__typename"))
              id = try reader.value(for: Field(responseName: "id"))
              title = try reader.value(for: Field(responseName: "title"))
              blobUrl = try reader.optionalValue(for: Field(responseName: "blobUrl"))
              createdAt = try reader.value(for: Field(responseName: "createdAt"))
            }
          }
        }
      }
    }
  }
}

public final class GetPostQuery: GraphQLQuery {
  public static let operationDefinition =
    "query GetPost($id: ID!) {" +
    "  getPost(id: $id) {" +
    "    __typename" +
    "    id" +
    "    title" +
    "    createdAt" +
    "    blobUrl" +
    "  }" +
    "}"

  public let id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLMappable {
    public let getPost: GetPost?

    public init(reader: GraphQLResultReader) throws {
      getPost = try reader.optionalValue(for: Field(responseName: "getPost", arguments: ["id": reader.variables["id"]]))
    }

    public struct GetPost: GraphQLMappable {
      public let __typename: String
      public let id: GraphQLID
      public let title: String
      public let createdAt: String
      public let blobUrl: String?

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))
        id = try reader.value(for: Field(responseName: "id"))
        title = try reader.value(for: Field(responseName: "title"))
        createdAt = try reader.value(for: Field(responseName: "createdAt"))
        blobUrl = try reader.optionalValue(for: Field(responseName: "blobUrl"))
      }
    }
  }
}

public final class UpdatePostMutation: GraphQLMutation {
  public static let operationDefinition =
    "mutation UpdatePost($post: UpdatePostInput!) {" +
    "  updatePost(input: $post) {" +
    "    __typename" +
    "    changedPost {" +
    "      __typename" +
    "      id" +
    "      title" +
    "      modifiedAt" +
    "    }" +
    "  }" +
    "}"

  public let post: UpdatePostInput

  public init(post: UpdatePostInput) {
    self.post = post
  }

  public var variables: GraphQLMap? {
    return ["post": post]
  }

  public struct Data: GraphQLMappable {
    public let updatePost: UpdatePost?

    public init(reader: GraphQLResultReader) throws {
      updatePost = try reader.optionalValue(for: Field(responseName: "updatePost", arguments: ["input": reader.variables["post"]]))
    }

    public struct UpdatePost: GraphQLMappable {
      public let __typename: String
      public let changedPost: ChangedPost?

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))
        changedPost = try reader.optionalValue(for: Field(responseName: "changedPost"))
      }

      public struct ChangedPost: GraphQLMappable {
        public let __typename: String
        public let id: GraphQLID
        public let title: String
        public let modifiedAt: String

        public init(reader: GraphQLResultReader) throws {
          __typename = try reader.value(for: Field(responseName: "__typename"))
          id = try reader.value(for: Field(responseName: "id"))
          title = try reader.value(for: Field(responseName: "title"))
          modifiedAt = try reader.value(for: Field(responseName: "modifiedAt"))
        }
      }
    }
  }
}