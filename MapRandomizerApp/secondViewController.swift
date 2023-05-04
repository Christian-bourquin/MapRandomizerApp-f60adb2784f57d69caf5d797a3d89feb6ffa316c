//
//  secondViewController.swift
//  MapRandomizerApp
//
//  Created by CHRISTIAN BOURQUIN on 2/16/23.
//

import UIKit
import MapKit
class secondViewController: UIViewController,MKMapViewDelegate,UITableViewDelegate,UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return directionsIn.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "theCell")!
        cell.textLabel?.text = directionsIn[indexPath.row]
                return cell
    }
    var incoming : [String] = []
    var incomingD : [String] = []
    var tIncoming : [String] = []
    var tIncomingD : [String] = []
    var incomingLong : [Double] = []
    var incomingLat : [Double] = []
    var tIncomingLong : [Double] = []
    var tIncomingLat : [Double] = []
    var a = 0
    var b = 0
    var test = 0
    var directionsIn = [String]()
var uniIndex = 0
    @IBOutlet weak var mapViewOutlet: MKMapView!
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    var currentStepIndex = 0
    @IBOutlet weak var labelOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapViewOutlet.delegate = self
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        tableViewOutlet.isHidden = true
        // Do any additional setup after loading the view.
        
//        let request = MKDirections.Request()
//               request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 40.7127, longitude: -74.0059), addressDictionary: nil))
//               request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 37.783333, longitude: -122.416667), addressDictionary: nil))
//               request.requestsAlternateRoutes = true
//        request.transportType = .
//
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let overlays = mapViewOutlet.overlays
        mapViewOutlet.removeOverlays(overlays)
        directionsIn.removeAll()
        tableViewOutlet.isHidden = true
         test = Int.random(in:1..<3)
        if test == 1 && tIncoming.count > 0{
             a = Int.random(in: 0..<tIncoming.count)
            labelOutlet.text = "\(tIncoming[a]): \(tIncomingD[a])"

            let request = MKDirections.Request()
                  request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 42.2371, longitude: -88.3225), addressDictionary: nil))
                  request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: tIncomingLat[a], longitude: tIncomingLong[a]), addressDictionary: nil))
                  request.requestsAlternateRoutes = true
                  request.transportType = .automobile

                  let directions = MKDirections(request: request)

                  directions.calculate { [unowned self] response, error in
                      guard let unwrappedResponse = response else { return }
                      let route = unwrappedResponse.routes[0]
                                  self.mapViewOutlet.addOverlay(route.polyline)

                          self.mapViewOutlet.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                      for i in 0...route.steps.count-1{
                          let step = route.steps[i]
                          directionsIn.append(step.instructions)
                          tableViewOutlet.reloadData()

                      }
                  }
            
           
            
        }
        else{
             b = Int.random(in: 0..<incoming.count)
            labelOutlet.text = "\(incoming[b]): \(incomingD[b]) mi"
            let request = MKDirections.Request()
                  request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 42.2371, longitude: -88.3225), addressDictionary: nil))
                  request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: incomingLat[b], longitude: incomingLong[b]), addressDictionary: nil))
                  request.requestsAlternateRoutes = true
                  request.transportType = .automobile

            var directions = MKDirections(request: request)

                  directions.calculate { [unowned self] response, error in
                      guard let unwrappedResponse = response else { return }
                      directionsIn.removeAll()

                      let route = unwrappedResponse.routes[0]
                                  self.mapViewOutlet.addOverlay(route.polyline)

                          self.mapViewOutlet.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                      for i in 0...route.steps.count-1{
                          let step = route.steps[i]
                          directionsIn.append(step.instructions)
                          tableViewOutlet.reloadData()

                      }                  }
        }
        
        
        
        
    }

    @IBAction func randomize(_ sender: Any) {
        let overlays = mapViewOutlet.overlays
        mapViewOutlet.removeOverlays(overlays)
         test = Int.random(in:1..<3)
        if test == 1 && tIncoming.count > 0{
             a = Int.random(in: 0..<tIncoming.count)
            labelOutlet.text = "\(tIncoming[a]): \(tIncomingD[a])"
            if uniIndex == 0 {
                let request = MKDirections.Request()
                      request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 42.2371, longitude: -88.3225), addressDictionary: nil))
                      request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: tIncomingLat[a], longitude: tIncomingLong[a]), addressDictionary: nil))
                      request.requestsAlternateRoutes = true
                      request.transportType = .automobile

                      let directions = MKDirections(request: request)

                      directions.calculate { [unowned self] response, error in
                          guard let unwrappedResponse = response else { return }
                          directionsIn.removeAll()

                          let route = unwrappedResponse.routes[0]
                                      self.mapViewOutlet.addOverlay(route.polyline)

                              self.mapViewOutlet.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                          for i in 0...route.steps.count-1{
                              let step = route.steps[i]
                              directionsIn.append(step.instructions)
                              tableViewOutlet.reloadData()

                          }
                      }
                
            }
            else if uniIndex == 1{
                let request = MKDirections.Request()
                      request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 42.2371, longitude: -88.3225), addressDictionary: nil))
                      request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: tIncomingLat[a], longitude: tIncomingLong[a]), addressDictionary: nil))
                      request.requestsAlternateRoutes = true
                request.transportType = .walking

                      let directions = MKDirections(request: request)

                      directions.calculate { [unowned self] response, error in
                          guard let unwrappedResponse = response else { return }
                          directionsIn.removeAll()

                          let route = unwrappedResponse.routes[0]
                                      self.mapViewOutlet.addOverlay(route.polyline)

                              self.mapViewOutlet.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                          for i in 0...route.steps.count-1{
                              let step = route.steps[i]
                              directionsIn.append(step.instructions)
                              tableViewOutlet.reloadData()

                          }
                      }
                
            }
            else if uniIndex == 2{
                let request = MKDirections.Request()
                      request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 42.2371, longitude: -88.3225), addressDictionary: nil))
                      request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: tIncomingLat[a], longitude: tIncomingLong[a]), addressDictionary: nil))
                      request.requestsAlternateRoutes = true
                request.transportType = .transit

                      let directions = MKDirections(request: request)

                      directions.calculate { [unowned self] response, error in
                          guard let unwrappedResponse = response else { return }
                          directionsIn.removeAll()

                          let route = unwrappedResponse.routes[0]
                                      self.mapViewOutlet.addOverlay(route.polyline)

                              self.mapViewOutlet.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                          for i in 0...route.steps.count-1{
                              let step = route.steps[i]
                              directionsIn.append(step.instructions)
                              tableViewOutlet.reloadData()

                          }
                      }
                
            }
        }
        else{
             b = Int.random(in: 0..<incoming.count)
            labelOutlet.text = "\(incoming[b]): \(incomingD[b]) mi"
            
            if uniIndex == 0 {
                let request = MKDirections.Request()
                      request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 42.2371, longitude: -88.3225), addressDictionary: nil))
                      request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: incomingLat[b], longitude: incomingLong[b]), addressDictionary: nil))
                      request.requestsAlternateRoutes = true
                      request.transportType = .automobile

                      let directions = MKDirections(request: request)

                      directions.calculate { [unowned self] response, error in
                          guard let unwrappedResponse = response else { return }
                          directionsIn.removeAll()

                          let route = unwrappedResponse.routes[0]
                                      self.mapViewOutlet.addOverlay(route.polyline)

                              self.mapViewOutlet.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                          for i in 0...route.steps.count-1{
                              let step = route.steps[i]
                              directionsIn.append(step.instructions)
                              tableViewOutlet.reloadData()

                          }
                      }
                
            }
            else if uniIndex == 1{
                let request = MKDirections.Request()
                      request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 42.2371, longitude: -88.3225), addressDictionary: nil))
                      request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: incomingLat[b], longitude: incomingLong[b]), addressDictionary: nil))
                      request.requestsAlternateRoutes = true
                request.transportType = .walking

                      let directions = MKDirections(request: request)

                      directions.calculate { [unowned self] response, error in
                          guard let unwrappedResponse = response else { return }
                          directionsIn.removeAll()

                          let route = unwrappedResponse.routes[0]
                                      self.mapViewOutlet.addOverlay(route.polyline)

                              self.mapViewOutlet.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                          for i in 0...route.steps.count-1{
                              let step = route.steps[i]
                              directionsIn.append(step.instructions)
                              tableViewOutlet.reloadData()

                          }
                      }
                
            }
            else if uniIndex == 2{
                let request = MKDirections.Request()
                      request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 42.2371, longitude: -88.3225), addressDictionary: nil))
                      request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: incomingLat[b], longitude: incomingLong[b]), addressDictionary: nil))
                      request.requestsAlternateRoutes = true
                request.transportType = .transit

                      let directions = MKDirections(request: request)

                      directions.calculate { [unowned self] response, error in
                          guard let unwrappedResponse = response else { return }
                          directionsIn.removeAll()

                          let route = unwrappedResponse.routes[0]
                                      self.mapViewOutlet.addOverlay(route.polyline)

                              self.mapViewOutlet.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                          for i in 0...route.steps.count-1{
                              let step = route.steps[i]
                              directionsIn.append(step.instructions)
                              tableViewOutlet.reloadData()

                          }                      }
                
            }
            
        }
        
    }
    
    @IBAction func segmentedControllerAction(_ sender: UISegmentedControl) {
        let overlays = mapViewOutlet.overlays
        mapViewOutlet.removeOverlays(overlays)

        var select = sender.selectedSegmentIndex
        uniIndex = select
        if test == 1 && tIncoming.count > 0{
            if select == 0 {
                let request = MKDirections.Request()
                      request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 42.2371, longitude: -88.3225), addressDictionary: nil))
                      request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: tIncomingLat[a], longitude: tIncomingLong[a]), addressDictionary: nil))
                      request.requestsAlternateRoutes = true
                      request.transportType = .automobile

                      let directions = MKDirections(request: request)

                      directions.calculate { [unowned self] response, error in
                          guard let unwrappedResponse = response else { return }
                          directionsIn.removeAll()

                          let route = unwrappedResponse.routes[0]
                                      self.mapViewOutlet.addOverlay(route.polyline)

                              self.mapViewOutlet.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                          for i in 0...route.steps.count-1{
                              let step = route.steps[i]
                              directionsIn.append(step.instructions)
                              tableViewOutlet.reloadData()

                          }
                      }
                
            }
            else if select == 1{
                let request = MKDirections.Request()
                      request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 42.2371, longitude: -88.3225), addressDictionary: nil))
                      request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: tIncomingLat[a], longitude: tIncomingLong[a]), addressDictionary: nil))
                      request.requestsAlternateRoutes = true
                request.transportType = .walking

                      let directions = MKDirections(request: request)

                      directions.calculate { [unowned self] response, error in
                          guard let unwrappedResponse = response else { return }
                          directionsIn.removeAll()

                          let route = unwrappedResponse.routes[0]
                                      self.mapViewOutlet.addOverlay(route.polyline)

                              self.mapViewOutlet.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                          for i in 0...route.steps.count-1{
                              let step = route.steps[i]
                              directionsIn.append(step.instructions)
                              tableViewOutlet.reloadData()

                          }
                      }
                
            }
            else if select == 2{
                let request = MKDirections.Request()
                      request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 42.2371, longitude: -88.3225), addressDictionary: nil))
                      request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: tIncomingLat[a], longitude: tIncomingLong[a]), addressDictionary: nil))
                      request.requestsAlternateRoutes = true
                request.transportType = .transit

                      let directions = MKDirections(request: request)

                      directions.calculate { [unowned self] response, error in
                          guard let unwrappedResponse = response else { return }
                          directionsIn.removeAll()

                          let route = unwrappedResponse.routes[0]
                                      self.mapViewOutlet.addOverlay(route.polyline)

                              self.mapViewOutlet.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                          for i in 0...route.steps.count-1{
                              let step = route.steps[i]
                              directionsIn.append(step.instructions)
                              tableViewOutlet.reloadData()

                          }
                      }
                
            }
        }
        else{
            if select == 0 {
                let request = MKDirections.Request()
                      request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 42.2371, longitude: -88.3225), addressDictionary: nil))
                      request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: incomingLat[b], longitude: incomingLong[b]), addressDictionary: nil))
                      request.requestsAlternateRoutes = true
                      request.transportType = .automobile

                      let directions = MKDirections(request: request)

                      directions.calculate { [unowned self] response, error in
                          guard let unwrappedResponse = response else { return }
                          directionsIn.removeAll()

                          let route = unwrappedResponse.routes[0]
                                      self.mapViewOutlet.addOverlay(route.polyline)

                              self.mapViewOutlet.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                          for i in 0...route.steps.count-1{
                              let step = route.steps[i]
                              directionsIn.append(step.instructions)
                              tableViewOutlet.reloadData()

                          }
                      }
                
            }
            else if select == 1{
                let request = MKDirections.Request()
                      request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 42.2371, longitude: -88.3225), addressDictionary: nil))
                      request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: incomingLat[b], longitude: incomingLong[b]), addressDictionary: nil))
                      request.requestsAlternateRoutes = true
                request.transportType = .walking

                      let directions = MKDirections(request: request)

                      directions.calculate { [unowned self] response, error in
                          guard let unwrappedResponse = response else { return }
                          directionsIn.removeAll()

                          let route = unwrappedResponse.routes[0]
                                      self.mapViewOutlet.addOverlay(route.polyline)

                              self.mapViewOutlet.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                          for i in 0...route.steps.count-1{
                              let step = route.steps[i]
                              directionsIn.append(step.instructions)
                              tableViewOutlet.reloadData()

                          }                      }
                
            }
            else if select == 2{
                let request = MKDirections.Request()
                      request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 42.2371, longitude: -88.3225), addressDictionary: nil))
                      request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: incomingLat[b], longitude: incomingLong[b]), addressDictionary: nil))
                      request.requestsAlternateRoutes = true
                request.transportType = .transit

                      let directions = MKDirections(request: request)

                      directions.calculate { [unowned self] response, error in
                          guard let unwrappedResponse = response else { return }
                          directionsIn.removeAll()

                          let route = unwrappedResponse.routes[0]
                                      self.mapViewOutlet.addOverlay(route.polyline)

                              self.mapViewOutlet.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                          for i in 0...route.steps.count-1{
                              let step = route.steps[i]
                              directionsIn.append(step.instructions)
                              tableViewOutlet.reloadData()

                          }
                      }
                
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        renderer.strokeColor = UIColor.blue
        return renderer
    }

    @IBAction func directionsButton(_ sender: Any) {
        if tableViewOutlet.isHidden == true{
            tableViewOutlet.isHidden = false
        }
        else{
            tableViewOutlet.isHidden = true
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
