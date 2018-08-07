/**
 * Copyright IBM Corporation 2018
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Foundation
import Kitura
import LoggerAPI
import Configuration
import CloudEnvironment
import KituraContracts
import Health
import KituraOpenAPI
import Dispatch

public let projectPath = ConfigurationManager.BasePath.project.path
public let health = Health()

public class App {
    let router = Router()
    let cloudEnv = CloudEnv()
<<<<<<< HEAD
    let nameSemaphore = DispatchSemaphore(value: 1)
    var name: String?
    let bookSemaphore = DispatchSemaphore(value: 1)
    var bookStore: [Book] = [Book(name: "Sample", author: "zzz", rating: 5)!]
=======
    let workerQueue = DispatchQueue(label: "worker")
    var bookStore: [Book] = [Book(name: "sample", author: "author", rating: 5)!]

>>>>>>> added sessions and authentication
    
    public init() throws {
        // Run the metrics initializer
        initializeMetrics(router: router)
        KituraOpenAPI.addEndpoints(to: router)
    }
    
    func postInit() throws {
        // Endpoints
        initializeHelloRoutes(app: self)
        initializeAdvancedRoutes(app: self)
        initializeStencilRoutes(app: self)
        initializeMarkdownRoutes(app: self)
        initializeErrorRoutes(app: self)
        initializeCodableRoutes(app: self)
        initializeTypeSafeAuthRoutes(app: self)
        initializeTypeSafeSessionsRoutes(app: self)
        initializeHealthRoutes(app: self)
        initializeStaticFileServers(app: self)
        initializeNotFoundRoute(app: self)
    }
    
    public func run() throws {
        try postInit()
        Kitura.addHTTPServer(onPort: cloudEnv.port, with: router)
        Kitura.run()
    }
}
