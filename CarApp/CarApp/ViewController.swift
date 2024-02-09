import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var car = Car()
    let colors = Feature(name: "Color", options: ["Red", "Blue", "Black", "White"])
    let tires = Feature(name: "Tires", options: ["Standard", "Sport", "All-terrain"])
    
    // This variable tracks the currently selected feature.
    var selectedFeature: Feature?
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var featureSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        selectFeature(colors) // Default to colors as the initial selection
        featureSegmentedControl.setTitle("Color", forSegmentAt: 0)
            featureSegmentedControl.setTitle("Tires", forSegmentAt: 1)    }
    
    // MARK: - UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return selectedFeature?.options.count ?? 0
    }
    
    // MARK: - UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return selectedFeature?.options[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let feature = selectedFeature else { return }
        
        let selectedOption = feature.options[row]
        switch feature.name {
        case "Color":
            car.color = selectedOption
        case "Tires":
            car.tires = selectedOption
        default:
            break
        }
    }
    
    // Functions to switch between features
    func selectFeature(_ feature: Feature) {
        selectedFeature = feature
        pickerView.reloadAllComponents()
    }
    
    @IBAction func featureSelectionChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            selectFeature(colors)
        case 1:
            selectFeature(tires)
        default:
            break    }
    
        
    }
}

