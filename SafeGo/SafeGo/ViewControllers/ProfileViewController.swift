//
//  ProfileViewController.swift
//  SafeGo
//
//  Created by Gabriela on 11/5/23.
//

import SwiftUI
import UIKit

struct ProfileViewController: UIViewControllerRepresentable {
    @Binding var image: Image?
    @Binding var userDefaultsKey: String

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var image: Image?
        @Binding var userDefaultsKey: String

        init(image: Binding<Image?>, userDefaultsKey: Binding<String>) {
            _image = image
            _userDefaultsKey = userDefaultsKey
        }

        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
        ) {
            if let uiImage = info[.originalImage] as? UIImage {
                image = Image(uiImage: uiImage)

                // Save the image data to UserDefaults
                if let jpegData = uiImage.jpegData(compressionQuality: 1.0) {
                    UserDefaults.standard.set(jpegData, forKey: userDefaultsKey)
                }
            }

            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(image: $image, userDefaultsKey: $userDefaultsKey)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ProfileViewController>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ProfileViewController>) {}
}

struct ProfileViewController_Previews: PreviewProvider {
    static var previews: some View {
        ProfileViewController(image: .constant(nil), userDefaultsKey: .constant("profileImage"))
    }
}


