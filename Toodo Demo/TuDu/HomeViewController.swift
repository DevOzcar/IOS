//
//  HomeViewController.swift
//  TuDu
//
//  Created by Oscar Borden on 20/12/16.
//  Copyright © 2016 SYE Software. All rights reserved.
//

import CVCalendar

class HomeViewController: UIViewController, CVCalendarViewDelegate, CVCalendarMenuViewDelegate, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var menuView: CVCalendarMenuView!
    @IBOutlet private weak var calendarView: CVCalendarView!
    @IBOutlet weak var tblEvents: UITableView!
    
    var selectedRowIndex: NSIndexPath = NSIndexPath(row: -1, section: 0)
    var aEvento: [Evento] = []
    var indxEvento = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.layoutIfNeeded()
        self.title = currentDate()
        
        aEvento = Evento.all() as! [Evento]
        
        tblEvents.delegate = self
        tblEvents.dataSource = self
        
        configureTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Menu delegate [Required]
        self.menuView.menuViewDelegate = self
        
        // Calendar delegate [Required]
        self.calendarView.calendarDelegate = self
        self.calendarView.changeDaysOutShowingState(false)
        
        
        
    }
    
    
    func didSelectDayView(_ dayView: CVCalendarDayView, animationDidFinish: Bool) {
        self.title = dayView.date.commonDescription
    }
    
    func presentedDateUpdated(_ date: CVDate) {
        self.title = date.commonDescription
    }
    
    func preliminaryView(shouldDisplayOnDayView dayView: DayView) -> Bool {
        return false
    }
    
    func shouldShowWeekdaysOut() -> Bool {
        // MARK: Optional methods
        return true
    }
    
    func presentationMode() -> CalendarMode {
        return CalendarMode.weekView
    }
    
    func firstWeekday() -> Weekday {
        return Weekday.monday
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        calendarView.commitCalendarViewUpdate()
        menuView.commitMenuViewUpdate()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func btnMenu(_ sender: UIBarButtonItem) {
        let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.mContainer?.toggle(MMDrawerSide.right, animated: true, completion: nil)
    }
    
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
            default:
                break
            }
        }
    }
    
    
    func currentDate() -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM, yyyy"
        return  formatter.string(from: date).uppercased()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRowIndex = indexPath as NSIndexPath
        tableView.beginUpdates()
        tableView.endUpdates()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedRowIndex.row {
            return 100
        }
        return 40
    }
    
    func configureTableView() {
        tblEvents.rowHeight = UITableViewAutomaticDimension
        tblEvents.estimatedRowHeight = 40
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aEvento.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellEvent", for: indexPath) as? ItemCalendarTableViewCell
        
        cell?.btnActivity.addTarget(self, action:#selector(opnActivityController), for: .touchUpInside)
        
        cell?.btnTime.tag = indexPath.row
        cell?.btnTime.addTarget(self, action:#selector(opnTimeController), for: .touchUpInside)
        
        
        cell?.btnPersons.addTarget(self, action:#selector(opnContactController), for: .touchUpInside)
        
        if aEvento[indexPath.row].name != nil {
            cell?.lblName.text = aEvento[indexPath.row].name
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm a"
        
        
        if aEvento[indexPath.row].when != nil {
            cell?.lblTime.text = dateFormatter.string(from: aEvento[indexPath.row].when as! Date)
        }
        return cell!
        
    }
    
    func opnActivityController(){
        self.performSegue(withIdentifier: "sgShowActivitys", sender: nil)
    }
    
    func opnTimeController(sender: UIButton!){
        indxEvento = sender.tag
        self.performSegue(withIdentifier: "sgTime", sender: nil)
    }
    
    func opnContactController(){
        self.performSegue(withIdentifier: "sgContact", sender: nil)
    }
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let value: String = segue.identifier!
        
        switch  value{
        case "sgShowActivitys" :
            let secondViewController = segue.destination as! ActivitysTableViewController
        case "sgTime" :
            let secondViewController = segue.destination as! TimeViewController
            secondViewController.indxEvento = indxEvento
        case "sgContact" :
            let secondViewController = segue.destination as! ContactViewController
            
        default :
            print("nothing")
        }
    }
    
    
    @IBAction func btnEventDetail(_ sender: Any) {
    }
    
    
    
}

