/**
 * 
 */
package org.hcl.props.cart;

import java.util.ArrayList;
import java.util.List;

/**
 * @author anshulmeena
 *
 */
public class Propscart {
	String Token;
	String cartId;
	List<String> cartItmes = new ArrayList<String>();
	String itemId;
	String itemTitle;
	String itemSubject;
	String employeeId;
	String employeeEmail;
	String employeeName;
	int itemsinCart;
	int quantity;
	/**
	 * @return the token
	 */
	public String getToken() {
		return Token;
	}
	/**
	 * @param token the token to set
	 */
	public void setToken(String token) {
		Token = token;
	}
	/**
	 * @return the cartId
	 */
	public String getCartId() {
		return cartId;
	}
	/**
	 * @param cartId the cartId to set
	 */
	public void setCartId(String cartId) {
		this.cartId = cartId;
	}
	/**
	 * @return the itemId
	 */
	public String getItemId() {
		return itemId;
	}
	/**
	 * @param itemId the itemId to set
	 */
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	/**
	 * @return the itemTitle
	 */
	public String getItemTitle() {
		return itemTitle;
	}
	/**
	 * @param itemTitle the itemTitle to set
	 */
	public void setItemTitle(String itemTitle) {
		this.itemTitle = itemTitle;
	}
	/**
	 * @return the itemSubject
	 */
	public String getItemSubject() {
		return itemSubject;
	}
	/**
	 * @param itemSubject the itemSubject to set
	 */
	public void setItemSubject(String itemSubject) {
		this.itemSubject = itemSubject;
	}
	/**
	 * @return the employeeId
	 */
	public String getEmployeeId() {
		return employeeId;
	}
	/**
	 * @param employeeId the employeeId to set
	 */
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	/**
	 * @return the employeeEmail
	 */
	public String getEmployeeEmail() {
		return employeeEmail;
	}
	/**
	 * @param employeeEmail the employeeEmail to set
	 */
	public void setEmployeeEmail(String employeeEmail) {
		this.employeeEmail = employeeEmail;
	}
	/**
	 * @return the employeeName
	 */
	public String getEmployeeName() {
		return employeeName;
	}
	/**
	 * @param employeeName the employeeName to set
	 */
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	/**
	 * @return the itemsinCart
	 */
	public int getItemsinCart() {
		return itemsinCart;
	}
	/**
	 * @param itemsinCart the itemsinCart to set
	 */
	public void setItemsinCart(int itemsinCart) {
		this.itemsinCart = itemsinCart;
	}
	/**
	 * @return the quantity
	 */
	public int getQuantity() {
		return quantity;
	}
	/**
	 * @param quantity the quantity to set
	 */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
