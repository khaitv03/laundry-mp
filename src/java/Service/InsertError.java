/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

/**
 *
 * @author khait
 */
public class InsertError {
    private String confirmNotMatch;
    private String UsernameDuplicateErr;
    private String EmailDuplicateErr;
    private String email;
    private String setInsertError;
    private String fullNameLengthErr;
    private String passwordLengthErr;
    private String PhoneDuplicateErr;
    private String phoneLengthErr;

    public InsertError(String confirmNotMatch, String UsernameDuplicateErr, String EmailDuplicateErr, String email, String setInsertError, String fullNameLengthErr, String passwordLengthErr, String PhoneDuplicateErr, String phoneLengthErr) {
        this.confirmNotMatch = confirmNotMatch;
        this.UsernameDuplicateErr = UsernameDuplicateErr;
        this.EmailDuplicateErr = EmailDuplicateErr;
        this.email = email;
        this.setInsertError = setInsertError;
        this.fullNameLengthErr = fullNameLengthErr;
        this.passwordLengthErr = passwordLengthErr;
        this.PhoneDuplicateErr = PhoneDuplicateErr;
        this.phoneLengthErr = phoneLengthErr;
    }

    public String getPhoneLengthErr() {
        return phoneLengthErr;
    }

    public void setPhoneLengthErr(String phoneLengthErr) {
        this.phoneLengthErr = phoneLengthErr;
    }

    

    public String getPasswordLengthErr() {
        return passwordLengthErr;
    }

    public void setPasswordLengthErr(String passwordLengthErr) {
        this.passwordLengthErr = passwordLengthErr;
    }

    public String getPhoneDuplicateErr() {
        return PhoneDuplicateErr;
    }

    public void setPhoneDuplicateErr(String PhoneDuplicateErr) {
        this.PhoneDuplicateErr = PhoneDuplicateErr;
    }
    

    public String getFullNameLengthErr() {
        return fullNameLengthErr;
    }

    public void setFullNameLengthErr(String fullNameLengthErr) {
        this.fullNameLengthErr = fullNameLengthErr;
    }

    

    public String getSetInsertError() {
        return setInsertError;
    }

    public void setSetInsertError(String setInsertError) {
        this.setInsertError = setInsertError;
    }


    public String getUsernameDuplicateErr() {
        return UsernameDuplicateErr;
    }

    public void setUsernameDuplicateErr(String UsernameDuplicateErr) {
        this.UsernameDuplicateErr = UsernameDuplicateErr;
    }

    public String getEmailDuplicateErr() {
        return EmailDuplicateErr;
    }

    public void setEmailDuplicateErr(String EmailDuplicateErr) {
        this.EmailDuplicateErr = EmailDuplicateErr;
    }

    public InsertError() {
    }

    public String getConfirmNotMatch() {
        return confirmNotMatch;
    }

    public void setConfirmNotMatch(String confirmNotMatch) {
        this.confirmNotMatch = confirmNotMatch;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


}
