//
//  PostDetailTableViewController.swift
//  Continuum
//
//  Created by Michael Di Cesare on 10/15/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var photoImage: UIImageView!
    
    var post: Post? {
        didSet {
            updateViews()
        }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    // MARK: - Actions
    
    @IBAction func commentButtonPressed(_ sender: Any) {
        presentCommentAlertController()
    }
    @IBAction func shareButtonPressed(_ sender: Any) {
        guard let comment = post?.caption else { return }
        let shareSheet = UIActivityViewController(activityItems: [comment], applicationActivities: nil)
        present(shareSheet, animated: true, completion: nil)
    }
    @IBAction func followButtonPressed(_ sender: Any) {
    }
    
    
    func updateViews() {
        guard let post = post else { return }
        photoImage.image = post.photo
        tableView.reloadData()
    }
    
    func presentCommentAlertController() {
        let alertController = UIAlertController(title: "Add Comment", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textFeild) in
            textFeild.placeholder = "Placeholder"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let commentAction = UIAlertAction(title: "Comment", style: .default) { (_) in
            guard let commentText = alertController.textFields?.first?.text, !commentText.isEmpty,
            let post = self.post else {return}
            PostController.shared.addComment(text: commentText, post: post, completion: { (comment) in

            })
            self.tableView.reloadData()
            
        }
        alertController.addAction(cancelAction)
        alertController.addAction(commentAction)
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
