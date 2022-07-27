//
//  implementTableViewController.swift
//  implement
//
//  Created by ESB17979 on 2022/6/10.
//

import UIKit
import SDWebImage

class implementTableViewController:UITableViewController {
  
    var todoItems: [TodoInfoContent]?
    var showTodoItems:[TodoInfo]?
    
    lazy var loadingView: UIActivityIndicatorView = {
        let activityindicatorView = UIActivityIndicatorView()
        activityindicatorView.translatesAutoresizingMaskIntoConstraints = false
        return activityindicatorView
    }()
        
        
        var searchController: UISearchController!
        
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(loadingView)
        
        loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 0).isActive = true
        loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 0).isActive = true
        
        fetchMovieItem()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func fetchMovieItem() {
        let url = URL(string: "https://itunes.apple.com/search?term=jack+johnson&entity=movie")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        loadingView.startAnimating()
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                OperationQueue.main.addOperation {
//                    self.showErrorMessageAlert("no data")
                    self.loadingView.stopAnimating()
                }
                return
            }
            
            guard error == nil else {
                OperationQueue.main.addOperation {
//                    self.showErrorMessageAlert(error?.localizedDescription ?? "something wrong")
                    self.loadingView.stopAnimating()
                }
                return
            }
            
            let model = try? JSONDecoder().decode(TodoInfo.self, from: data)
            self.todoItems = model?.results
            
//            DispatchQueue.main.async{
//                self.tableView.reloadData()
//                self.loadingView.stopAnimating()
//            }
            
            self.fetchSongItem()
            
        }
        dataTask.resume()
    }
    
    
    func fetchSongItem() {
        let url = URL(string: "https://itunes.apple.com/search?term=mayday&entity=song")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
//        loadingView.startAnimating()
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                OperationQueue.main.addOperation {
//                    self.showErrorMessageAlert("no data")
                    self.loadingView.stopAnimating()
                }
                return
            }
            
            guard error == nil else {
                OperationQueue.main.addOperation {
//                    self.showErrorMessageAlert(error?.localizedDescription ?? "something wrong")
                    self.loadingView.stopAnimating()
                }
                return
            }
            
            let model = try? JSONDecoder().decode(TodoInfo.self, from: data)
            
            self.todoItems?.append(contentsOf: model?.results ?? [])
//            self.todoItems = model?.results
            
            DispatchQueue.main.async{
                self.tableView.reloadData()
                self.loadingView.stopAnimating()
            }
            
        }
        dataTask.resume()
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->Int {
        return todoItems?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! implementTableViewCell
        
        cell.textLabel?.numberOfLines = 0
//        cell.imageView?.
//        cell.imageView?.image = UIImage(data: artworkUrl100.image)
        
        
//        cell.imageView?.image = todoItems?[indexPath.row].artworkUrl100
        
        let urlText = todoItems?[indexPath.row].artworkUrl100 ?? ""
        print("qaz \(urlText)")
        if let url = URL(string: urlText) {
            cell.movieImageView.sd_setImage(with: url)
        }
                
                
                
        
        
        let kind = todoItems?[indexPath.row].kind
        let trackName = todoItems?[indexPath.row].trackName
        cell.tracknameLabel?.text = "[\(kind ?? "")] - \(trackName ?? "")"
        cell.artistnameLabel?.text = todoItems?[indexPath.row].artistName
//        cell.accessoryType = (todoItems?[indexPath.row].completed ?? false ? .checkmark : .none)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let trackViewUrl = todoItems?[indexPath.row].trackViewUrl
        if let link = URL(string: trackViewUrl ?? "") {
          UIApplication.shared.open(link)
        }
        
        
//        print("qaz \(todoItems?[indexPath.row].trackViewUrl)")
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
