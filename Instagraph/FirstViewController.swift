//
//  FirstViewController.swift
//  Instagraph
//
//  Created by Michael Paris on 2/27/17.
//  Copyright © 2017 Michael Paris. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController {
    
    var viewer: AllPostsQuery.Data.Viewer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Fetch a single item from our GraphQL server
        // graphql.fetch(query: GetPostQuery(id: "UG9zdDox")) { (result, error) in
        //     print(result?.data?.getPost?.title ?? "no title")
        // }
        
        // Fetch a single item & watch for changes
        // _ = graphql.watch(query: GetPostQuery(id: "UG9zdDox")) { (result, error) in
        //     self.updateUI(post: result?.data?.getPost)
        // }
        
        // Control normalization behavior by pointing to the globally unique id field.
        // graphql.cacheKeyForObject = { $0["id"] }
        
        loadPosts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI(post: GetPostQuery.Data.GetPost?) {
        print(post?.title ?? "no title")
    }
    
    func updatePostTitle(title: String) {
        graphql.perform(mutation: UpdatePostMutation(post: UpdatePostInput(title: title, id: "UG9zdDox"))) { (result, error) in
            print(result?.data?.updatePost?.changedPost?.modifiedAt ?? "didn't update")
        }
    }
    
    private func loadPosts() {
        graphql.fetch(query: AllPostsQuery()) { (result, error) in
            self.viewer = result?.data?.viewer
            self.tableView.reloadData()
        }
    }
    
    /**
    * TableView Data Source
    */
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewer?.allPosts?.edges?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "PostTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PostCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        // Configure the cell...
        let post = self.viewer?.allPosts?.edges?[indexPath.row]?.node
        
        let defaultImage = "https://placeholdit.imgix.net/~text?txtsize=28&txt=300%C3%97300&w=300&h=300"
        
        let url:NSURL? = NSURL(string: post?.blobUrl ?? defaultImage)
        let data:Data? = NSData(contentsOf: url! as URL) as Data?
        let image = UIImage(data : data!)
        cell.postImageView.image = image
        cell.postTitleLabel.text = post?.title ?? "No Title"
        return cell
    }
}

