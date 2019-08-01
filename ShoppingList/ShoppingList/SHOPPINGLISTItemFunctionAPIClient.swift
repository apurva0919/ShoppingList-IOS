/*
 Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */


import AWSCore
import AWSAPIGateway

public class SHOPPINGLISTItemFunctionAPIClient: AWSAPIGatewayClient {

	static let AWSInfoClientKey = "SHOPPINGLISTItemFunctionAPIClient"

	private static let _serviceClients = AWSSynchronizedMutableDictionary()
	private static let _defaultClient:SHOPPINGLISTItemFunctionAPIClient = {
		var serviceConfiguration: AWSServiceConfiguration? = nil
        let serviceInfo = AWSInfo.default().defaultServiceInfo(AWSInfoClientKey)
        if let serviceInfo = serviceInfo {
            serviceConfiguration = AWSServiceConfiguration(region: serviceInfo.region, credentialsProvider: serviceInfo.cognitoCredentialsProvider)
        } else if (AWSServiceManager.default().defaultServiceConfiguration != nil) {
            serviceConfiguration = AWSServiceManager.default().defaultServiceConfiguration
        } else {
            serviceConfiguration = AWSServiceConfiguration(region: .Unknown, credentialsProvider: nil)
        }
        
        return SHOPPINGLISTItemFunctionAPIClient(configuration: serviceConfiguration!)
	}()
    
	/**
	 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `AWSServiceManager.defaultServiceManager()`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.
	
	 If you want to enable AWS Signature, set the default service configuration in `func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?)`
	
	     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
	        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
	        let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
	        AWSServiceManager.default().defaultServiceConfiguration = configuration
	 
	        return true
	     }
	
	 Then call the following to get the default service client:
	
	     let serviceClient = SHOPPINGLISTItemFunctionAPIClient.default()

     Alternatively, this configuration could also be set in the `info.plist` file of your app under `AWS` dictionary with a configuration dictionary by name `SHOPPINGLISTItemFunctionAPIClient`.
	
	 @return The default service client.
	 */ 
	 
	public class func `default`() -> SHOPPINGLISTItemFunctionAPIClient{
		return _defaultClient
	}

	/**
	 Creates a service client with the given service configuration and registers it for the key.
	
	 If you want to enable AWS Signature, set the default service configuration in `func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?)`
	
	     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
	         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
	         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
	         SHOPPINGLISTItemFunctionAPIClient.registerClient(withConfiguration: configuration, forKey: "USWest2SHOPPINGLISTItemFunctionAPIClient")
	
	         return true
	     }
	
	 Then call the following to get the service client:
	
	
	     let serviceClient = SHOPPINGLISTItemFunctionAPIClient.client(forKey: "USWest2SHOPPINGLISTItemFunctionAPIClient")
	
	 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.
	
	 @param configuration A service configuration object.
	 @param key           A string to identify the service client.
	 */
	
	public class func registerClient(withConfiguration configuration: AWSServiceConfiguration, forKey key: String){
		_serviceClients.setObject(SHOPPINGLISTItemFunctionAPIClient(configuration: configuration), forKey: key  as NSString);
	}

	/**
	 Retrieves the service client associated with the key. You need to call `registerClient(withConfiguration:configuration, forKey:)` before invoking this method or alternatively, set the configuration in your application's `info.plist` file. If `registerClientWithConfiguration(configuration, forKey:)` has not been called in advance or if a configuration is not present in the `info.plist` file of the app, this method returns `nil`.
	
	 For example, set the default service configuration in `func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) `
	
	     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
	         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
	         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
	         SHOPPINGLISTItemFunctionAPIClient.registerClient(withConfiguration: configuration, forKey: "USWest2SHOPPINGLISTItemFunctionAPIClient")
	
	         return true
	     }
	
	 Then call the following to get the service client:
	 
	 	let serviceClient = SHOPPINGLISTItemFunctionAPIClient.client(forKey: "USWest2SHOPPINGLISTItemFunctionAPIClient")
	 
	 @param key A string to identify the service client.
	 @return An instance of the service client.
	 */
	public class func client(forKey key: String) -> SHOPPINGLISTItemFunctionAPIClient {
		objc_sync_enter(self)
		if let client: SHOPPINGLISTItemFunctionAPIClient = _serviceClients.object(forKey: key) as? SHOPPINGLISTItemFunctionAPIClient {
			objc_sync_exit(self)
		    return client
		}

		let serviceInfo = AWSInfo.default().defaultServiceInfo(AWSInfoClientKey)
		if let serviceInfo = serviceInfo {
			let serviceConfiguration = AWSServiceConfiguration(region: serviceInfo.region, credentialsProvider: serviceInfo.cognitoCredentialsProvider)
			SHOPPINGLISTItemFunctionAPIClient.registerClient(withConfiguration: serviceConfiguration!, forKey: key)
		}
		objc_sync_exit(self)
		return _serviceClients.object(forKey: key) as! SHOPPINGLISTItemFunctionAPIClient;
	}

	/**
	 Removes the service client associated with the key and release it.
	 
	 @warning Before calling this method, make sure no method is running on this client.
	 
	 @param key A string to identify the service client.
	 */
	public class func removeClient(forKey key: String) -> Void{
		_serviceClients.remove(key)
	}
	
	init(configuration: AWSServiceConfiguration) {
	    super.init()
	
	    self.configuration = configuration.copy() as! AWSServiceConfiguration
	    var URLString: String = "https://tdgp7lq6ki.execute-api.us-east-2.amazonaws.com/dev"
	    if URLString.hasSuffix("/") {
	        URLString = URLString.substring(to: URLString.index(before: URLString.endIndex))
	    }
	    self.configuration.endpoint = AWSEndpoint(region: configuration.regionType, service: .APIGateway, url: URL(string: URLString))
	    let signer: AWSSignatureV4Signer = AWSSignatureV4Signer(credentialsProvider: configuration.credentialsProvider, endpoint: self.configuration.endpoint)
	    if let endpoint = self.configuration.endpoint {
	    	self.configuration.baseURL = endpoint.url
	    }
	    self.configuration.requestInterceptors = [AWSNetworkingRequestInterceptor(), signer]
	}

	
    /*
     
     
     @param body 
     
     return type: Empty
     */
    // Invitation
    
    public func invitationfunctionPost(body: SHOPPINGLISTInvitationPost) -> AWSTask<Empty> {
        let headerParameters = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            
            ]
        
        let queryParameters:[String:Any] = [:]
        
        let pathParameters:[String:Any] = [:]
        
        return self.invokeHTTPRequest("POST", urlString: "/invitationfunction", pathParameters: pathParameters, queryParameters: queryParameters, headerParameters: headerParameters, body: body, responseClass: Empty.self) as! AWSTask<Empty>
    }
    
    
    /*
     
     
     @param inviteeName
     
     return type: SHOPPINGLISTInvitationGET
     */
    public func invitationfunctionInviteeNameGet(inviteeName: String) -> AWSTask<SHOPPINGLISTInvitationGET> {
        let headerParameters = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            
            ]
        
        let queryParameters:[String:Any] = [:]
        
        var pathParameters:[String:Any] = [:]
        pathParameters["inviteeName"] = inviteeName
        
        return self.invokeHTTPRequest("GET", urlString: "/invitationfunction/{inviteeName}", pathParameters: pathParameters, queryParameters: queryParameters, headerParameters: headerParameters, body: nil, responseClass: SHOPPINGLISTInvitationGET.self) as! AWSTask<SHOPPINGLISTInvitationGET>
    }
    
    
    /*
     
     
     @param listName
     @param inviteeName
     
     return type: Empty
     */
    public func invitationfunctionInviteeNameListNameDelete(listName: String, inviteeName: String) -> AWSTask<Empty> {
        let headerParameters = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            
            ]
        
        let queryParameters:[String:Any] = [:]
        
        var pathParameters:[String:Any] = [:]
        pathParameters["listName"] = listName
        pathParameters["inviteeName"] = inviteeName
        
        return self.invokeHTTPRequest("DELETE", urlString: "/invitationfunction/{inviteeName}/{listName}", pathParameters: pathParameters, queryParameters: queryParameters, headerParameters: headerParameters, body: nil, responseClass: Empty.self) as! AWSTask<Empty>
    }
    
    //Item
    public func itemFunctionPost(body: SHOPPINGLISTItemPOST) -> AWSTask<Empty> {
	    let headerParameters = [
                   "Content-Type": "application/json",
                   "Accept": "application/json",
                   
	            ]
	    
	    let queryParameters:[String:Any] = [:]
	    
	    let pathParameters:[String:Any] = [:]
	    
	    return self.invokeHTTPRequest("POST", urlString: "/itemFunction", pathParameters: pathParameters, queryParameters: queryParameters, headerParameters: headerParameters, body: body, responseClass: Empty.self) as! AWSTask<Empty>
	}

	
    /*
     
     
     @param listName 
     
     return type: SHOPPINGLISTItemGET
     */
    public func itemFunctionListNameGet(listName: String) -> AWSTask<SHOPPINGLISTItemGET> {
	    let headerParameters = [
                   "Content-Type": "application/json",
                   "Accept": "application/json",
                   
	            ]
	    
	    let queryParameters:[String:Any] = [:]
	    
	    var pathParameters:[String:Any] = [:]
	    pathParameters["listName"] = listName
	    
	    return self.invokeHTTPRequest("GET", urlString: "/itemFunction/{listName}", pathParameters: pathParameters, queryParameters: queryParameters, headerParameters: headerParameters, body: nil, responseClass: SHOPPINGLISTItemGET.self) as! AWSTask<SHOPPINGLISTItemGET>
	}

	
    /*
     
     
     @param listName 
     @param itemName 
     
     return type: Empty
     */
    public func itemFunctionListNameItemNameDelete(listName: String, itemName: String) -> AWSTask<Empty> {
	    let headerParameters = [
                   "Content-Type": "application/json",
                   "Accept": "application/json",
                   
	            ]
	    
	    let queryParameters:[String:Any] = [:]
	    
	    var pathParameters:[String:Any] = [:]
	    pathParameters["listName"] = listName
	    pathParameters["itemName"] = itemName
	    
	    return self.invokeHTTPRequest("DELETE", urlString: "/itemFunction/{listName}/{itemName}", pathParameters: pathParameters, queryParameters: queryParameters, headerParameters: headerParameters, body: nil, responseClass: Empty.self) as! AWSTask<Empty>
	}

	
    /*
     
     
     @param body 
     
     return type: Empty
     */
    public func listfunctionPost(body: SHOPPINGLISTListPOST) -> AWSTask<Empty> {
	    let headerParameters = [
                   "Content-Type": "application/json",
                   "Accept": "application/json",
                   
	            ]
	    
	    let queryParameters:[String:Any] = [:]
	    
	    let pathParameters:[String:Any] = [:]
	    
	    return self.invokeHTTPRequest("POST", urlString: "/listfunction", pathParameters: pathParameters, queryParameters: queryParameters, headerParameters: headerParameters, body: body, responseClass: Empty.self) as! AWSTask<Empty>
	}

	
    /*
     
     
     @param userName 
     
     return type: SHOPPINGLISTListGET
     */
    public func listfunctionUserNameGet(userName: String) -> AWSTask<SHOPPINGLISTListGET> {
	    let headerParameters = [
                   "Content-Type": "application/json",
                   "Accept": "application/json",
                   
	            ]
	    
	    let queryParameters:[String:Any] = [:]
	    
	    var pathParameters:[String:Any] = [:]
	    pathParameters["userName"] = userName
	    
	    return self.invokeHTTPRequest("GET", urlString: "/listfunction/{userName}", pathParameters: pathParameters, queryParameters: queryParameters, headerParameters: headerParameters, body: nil, responseClass: SHOPPINGLISTListGET.self) as! AWSTask<SHOPPINGLISTListGET>
	}

	
    /*
     
     
     @param userName 
     @param listName 
     
     return type: Empty
     */
    public func listfunctionUserNameListNameDelete(userName: String, listName: String) -> AWSTask<Empty> {
	    let headerParameters = [
                   "Content-Type": "application/json",
                   "Accept": "application/json",
                   
	            ]
	    
	    let queryParameters:[String:Any] = [:]
	    
	    var pathParameters:[String:Any] = [:]
	    pathParameters["userName"] = userName
	    pathParameters["listName"] = listName
	    
	    return self.invokeHTTPRequest("DELETE", urlString: "/listfunction/{userName}/{listName}", pathParameters: pathParameters, queryParameters: queryParameters, headerParameters: headerParameters, body: nil, responseClass: Empty.self) as! AWSTask<Empty>
	}

	
    /*
     
     
     @param userName 
     @param password 
     
     return type: SHOPPINGLISTUserModel
     */
    public func userfunctionUserNamePasswordGet(userName: String, password: String) -> AWSTask<SHOPPINGLISTUserModel> {
	    let headerParameters = [
                   "Content-Type": "application/json",
                   "Accept": "application/json",
                   
	            ]
	    
	    let queryParameters:[String:Any] = [:]
	    
	    var pathParameters:[String:Any] = [:]
	    pathParameters["userName"] = userName
	    pathParameters["password"] = password
	    
	    return self.invokeHTTPRequest("GET", urlString: "/userfunction/{userName}/{password}", pathParameters: pathParameters, queryParameters: queryParameters, headerParameters: headerParameters, body: nil, responseClass: SHOPPINGLISTUserModel.self) as! AWSTask<SHOPPINGLISTUserModel>
	}




}
