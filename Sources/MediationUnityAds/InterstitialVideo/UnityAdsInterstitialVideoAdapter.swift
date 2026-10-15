//
//  UnityAdsInterstitialVideoAdapter.swift
//  MediationUnityAds
//
//  Created by Odin.송황호 on 6/25/24.
//

import UIKit

import APSSPSDK


final public class UnityAdsInterstitialVideoAdapter: APSSPInterstitialVideoAdapterProtocol {
   
    private var interstitialVideoAd: UnityAdsMediationInterstitialVideoAd?
    
    public weak var delegate: APSSPInterstitialVideoAdapterDelegate?
    
    public weak var rootViewController: UIViewController?
    
    deinit {
        APLogger.debug("UnityAdsInterstitialVideoAdapter deinit")
    }

    public init(placementDic: [String: String], rootViewController: UIViewController?, info: [String : Any?]) {
        let placementId = placementDic[APSSPPlacementKey.unityPlacementId.rawValue] ?? ""
        let gameID = placementDic[APSSPPlacementKey.unityGameId.rawValue] ?? ""
        interstitialVideoAd = UnityAdsMediationInterstitialVideoAd(gameID: gameID, placementId: placementId)
        self.interstitialVideoAd?.delegate = self
    }
    
    public func present(from: UIViewController, completion: @escaping () -> Void) {
        interstitialVideoAd?.present(from: from) { completion() }
    }
    
    public func connectDelegate(delegate: APSSPInterstitialVideoAdapterDelegate) {
        self.delegate = delegate
        self.interstitialVideoAd?.load()
    }

    public func disconnectDelegate() {
        interstitialVideoAd?.delegate = nil
        delegate = nil
    }
}


extension UnityAdsInterstitialVideoAdapter: APSSPInterstitialVideoAdapterDelegate {
    
    public func interstitialVideoLoadSuccess() {
        delegate?.interstitialVideoLoadSuccess()
    }
    
    public func interstitialVideoLoadFail(error: APSSPNetworkError, errorMessage: String?) {
        delegate?.interstitialVideoLoadFail(error: error, errorMessage: errorMessage)
    }
    
    public func interstitialVideoShowSuccess(message: String) {
        delegate?.interstitialVideoShowSuccess(message: message)
    }
    
    public func interstitialVideoShowFail(message: String) {
        delegate?.interstitialVideoShowFail(message: message)
    }
    
    public func interstitialVideoClicked(message: String) {
        delegate?.interstitialVideoClicked(message: message)
    }
    
    public func interstitialVideoClosed(message: String) {
        delegate?.interstitialVideoClosed(message: message)
    }
}
