import SwiftSMTP
import SwiftUI

func sendMail(image: Data?) {
    let smtp = SMTP(
        hostname: "email-smtp.us-east-1.amazonaws.com",     // SMTP server address
        email: "AKIAUTBUREP3GSRCPU53",        // username to login
        password: "BMpCX+G8E7hF6pUmNjksED24NiTca762py3lNs8A0saG",
        port:  587,
        tlsMode: .requireSTARTTLS,
        tlsConfiguration: nil,
        authMethods: [],
        domainName: "localhost",
        timeout: 10// password to login
    )
    
    let sender = Mail.User(name: "Finer_app", email: "hamnuk2004@gmail.com")
    let reciever = Mail.User(name: "Fez_Refitben", email: "hamnuk2004@gmail.com")
    
    let dataAttachment = Attachment(
        data: image!,
        mime: "image/jpeg",
        name: "image.jpeg",
        // send as a standalone attachment
        inline: true
    )
    
    let mail = Mail(
        from: sender,
        to: [reciever],
        subject: "Нове правопорушення",
        text: "Фото:",
        attachments: [dataAttachment]
    )
    
    smtp.send(mail) { (error) in
        if let error = error {
            print(error)
        }
    }
}

