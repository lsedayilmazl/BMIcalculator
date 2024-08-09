import UIKit


class ViewController: UIViewController{
    
    @IBOutlet var boyTextField: UITextField!
    @IBOutlet var kiloTextField: UITextField!
    @IBOutlet var calculateButton: UIButton!
    @IBOutlet var labelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func hesaplaButton(_sender: UIButton){
        guard let boyStr = boyTextField.text, !boyStr.isEmpty,
              let kiloStr = kiloTextField.text, !kiloStr.isEmpty else{
            showErrMsg(message: "Boy ve kilo boş bırakılamaz!")
            return
        }
        let boy = Double(boyTextField.text!)
        let kilo = Double(kiloTextField.text!)
        let result = calculateBMI(boy: boy!, kilo: kilo!)
        labelResult.text = result
    }
    
    
    func calculateBMI(boy: Double, kilo: Double) -> String {
        let bmi = kilo / (boy * boy)
        let formattedBmi = String(format: "%.1f", bmi)
        if bmi <= 18.6 {
            return "BMI: \(formattedBmi) : Zayıf"
        } else if bmi <= 24.9 {
            return "BMI: \(formattedBmi) : Normal"
        } else if bmi <= 29.9 {
            return "BMI: \(formattedBmi) : Kilolu"
        } else {
            return "BMI: \(formattedBmi) : Obezite"
        }
    }
    func showErrMsg(message: String) {
        let alert = UIAlertController(title: "Hata", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}





