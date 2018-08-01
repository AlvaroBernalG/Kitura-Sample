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

func initializeHelloRoutes(app: App) {
    app.router.get("/hello") { _, response, next in
        response.headers["Content-Type"] = "text/plain; charset=utf-8"
        try response.send("Hello, from Kitura!").end()
    }

    // This route accepts POST requests
    app.router.post("/hello") {request, response, next in
        response.headers["Content-Type"] = "text/plain; charset=utf-8"
        try response.send("Got a POST request").end()
    }

    // This route accepts PUT requests
    app.router.put("/hello") {request, response, next in
        response.headers["Content-Type"] = "text/plain; charset=utf-8"
        try response.send("Got a PUT request").end()
    }

    // This route accepts DELETE requests
    app.router.delete("/hello") {request, response, next in
        response.headers["Content-Type"] = "text/plain; charset=utf-8"
        try response.send("Got a DELETE request").end()
    }
}
