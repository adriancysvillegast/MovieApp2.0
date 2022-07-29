//
//  KeychainManager.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 28/7/22.
//

import Foundation

class KeychainManager {
    
    enum KeychainError: Error{
        case itemNotFound
        case duplicateItem
        case invalidateItemFormat
        case unexpectedStatus(OSStatus)
    }
    
    static func save(service: String, account: String, password: Data) throws {
        print("is saving keychain")
        
        let query: [String: AnyObject] = [
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            // kSecValueData is the item value to save
            kSecValueData as String: password as AnyObject
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status == errSecDuplicateItem {
            throw KeychainError.duplicateItem
        }
        
        guard status == errSecSuccess else {
            throw KeychainError.unexpectedStatus(status)
        }
    }
    
    static func get(service: String, account: String) throws -> Data {
        let query: [String: AnyObject] = [
            //kSecAttrService, kSecAttrAccount, kSecClass just identify the item to read in keychain
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            //only the most recent iten is maching this query
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnData as String: kCFBooleanTrue
            
        ]
        
        var itemCopy: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &itemCopy)
        
        guard status != errSecItemNotFound else {
            throw KeychainError.itemNotFound
        }
        
        guard status == errSecSuccess else {
            throw KeychainError.unexpectedStatus(status)
        }
        
        guard let password = itemCopy as? Data else {
            throw KeychainError.invalidateItemFormat
        }
        
        return password
    }
    
}
