/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.model.Item;
import java.util.List;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.scheduling.annotation.Async;
import java.util.Locale;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

@Service("emailSenderService")
public class EmailSenderService {

    @Autowired
    private JavaMailSender javaMailSender;

    @Async
    public void sendEmail(SimpleMailMessage email) {
        javaMailSender.send(email);
    }
    @Autowired
    private TemplateEngine templateEngine;

    public void sendOrderEmail(String recipientEmail, String subject,String htmlMsg) throws MessagingException {

        
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, "UTF-8");
        mimeMessageHelper.setSubject(subject);
        mimeMessageHelper.setTo(recipientEmail);

        mimeMessage.setContent(htmlMsg, "text/html");
        
        // Send email
        javaMailSender.send(mimeMessage);
    }

}
