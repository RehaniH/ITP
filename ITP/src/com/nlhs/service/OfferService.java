package com.nlhs.service;

import java.util.ArrayList;



import com.nlhs.model.offer;

public interface OfferService {

	public void addOffer(offer offer) ;
	
	public ArrayList<offer> getOffers();
	
	public offer getOfferByID(String offerId);
	
	public offer updateOffer(String offerId, offer offer);
	
	public void removeOffer(String offerId);

	
}
