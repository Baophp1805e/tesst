//
//  NewEventClassViewController.swift
//  Miagi-Reminder
//
//  Created by apple on 8/12/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

class NewEventClassViewController: UIViewController, UITextFieldDelegate, CLLocationManagerDelegate , GMSMapViewDelegate {
    
    @IBOutlet weak var googleMaps: GMSMapView?
    var locationManager = CLLocationManager()
    @IBOutlet weak var txtDatePickerDen: UITextField!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDescribe: UITextField!
    @IBOutlet weak var txtDatePickerFrom: UITextField!
  
    @IBOutlet weak var cityLabel: UILabel!
    private var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        handlePicker()
        self.title = "New Event"
        mapGoole()
        showDatePicker()
        googleMaps?.delegate = self
        //        mapView(googleMaps!, didTapAt: coordinate )
    }
    
    func mapGoole()  {
        let camera = GMSCameraPosition.camera(withLatitude: 21.016431, longitude: 105.795290, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
//       ew = mapView
        googleMaps?.camera = camera
        googleMaps?.delegate = self
        googleMaps?.isMyLocationEnabled = true
        googleMaps?.settings.myLocationButton = true
        
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func showDatePicker(){
        //Formate Date
        datePicker = UIDatePicker()
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        txtDatePickerFrom.inputAccessoryView = toolbar
        txtDatePickerDen.inputAccessoryView = toolbar
        txtDatePickerFrom.inputView = datePicker
        txtDatePickerDen.inputView = datePicker
    }
  
    
    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        let strDate = formatter.string(from: datePicker.date)
        
        let minDate:Date? = formatter.date(from: txtDatePickerFrom.text!)
        //        let maxDate:Date? = formatter.date(from: txtDatePickerDen.text!)
        if txtDatePickerFrom.isFirstResponder {
            txtDatePickerFrom.text = strDate
            datePicker.minimumDate = Date()
        } else {
            txtDatePickerDen.text = strDate
            datePicker.minimumDate = minDate
        }
        self.view.endEditing(true)
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("You tapped at \(coordinate.latitude), \(coordinate.longitude)")
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let commentVc = storyBoard.instantiateViewController(withIdentifier: "mapVC") as? MapsVC
        self.navigationController?.pushViewController(commentVc!, animated: true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    @IBAction func btnSave(_ sender: Any) {
        
    }
    
    
}
