/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author kanathip
 */
public class ErrorNortification extends Exception{
    
    public ErrorNortification(){
        super("This Process has error");
    }
    
    public ErrorNortification(String message){
        super(message);
    }
}
