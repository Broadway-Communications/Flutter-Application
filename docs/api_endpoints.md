# API Endpoints Documentation

Here's the list of all the API endpoints from the documentation

1. [**User Authentication**](#1-user-authentication)
    - [`/auth/login`](#authlogin---post)- **POST**: User login.
    - [`/auth/logout`](#authlogout---post) - **POST**: User logout.
    - [`/auth/request-reset-password`](#authrequest-reset-password---post) - **POST**: Initiate a password reset.
    - [`/auth/confirm-reset-password`](#authconfirm-reset-password---patch) - **PATCH**: Confirm and process the password reset.
2. [**User Details / User Plans / User Location**](#2-user-details)
    - [`/user/info/profile`](#userinfoprofile---get) - **GET**: Fetch user details.
    - [`/user/plan/current`](#userplancurrent---get) - **GET**: Details of the user's current plan.
    - [`/user/plan/history`](#userplanhistory---get) - **GET**: Details of all the plans user has subscribed.
    - [`/user/info/geo-location`](#userinfogeo-location---get) - **GET**: Retrieve updated location of the user.
    - [`/user/update/email`](#userupdateemail---patch) - **PATCH**: Update user's email.
    - [`/user/update/password`](#userupdatepassword---patch) - **PATCH**: Update user's password.
    - [`/user/update/mobile`](#userupdatemobile---patch) - **PATCH**: Update user's mobile number.
    - [`/user/update/mac-address`](#userupdatemac-address---patch) - **PATCH**: Update user's MAC address.
    - [`/user/update/geo-location`](#userupdategeo-location---patch) - **PATCH**: Update user's geolocation.
3. [**Enterprise Plans**](#3-enterprise-plans)

    - [`/company/service/plans`](#companyserviceplans---get) - **GET**: Retrieve the current enterprise plans.

4. [**User Complaints**](#4-complaints)

    - [`/user/complaint/new-complaint`](#usercomplaintnew-complaint---post) - **POST**: Registration of new complaint.
    - [`/user/complaint/history`](#usercomplainthistory---get) - **GET**: Details of the complaints raised by the user.

5. [**Company's policy details**](#5-companys-policy-details)

    - [`/company/info/faq`](#companyinfofaq---get) - **GET**: Details of Frequently Asked Questions.
    - [`/company/info/privacy-policy`](#companyinfoprivacy-policy---get) - **GET**: Privacy policies of the company.
    - [`/company/info/terms-conditions`](#companyinfoterms-conditions---get) - **GET**: Terms and conditions of the company.

6. [**Session History**](#6-session-history)

    - [`/user/info/session-history`](#userinfosession-history---get) - **GET**: Session history of the user.

7. **Payment Gateway and Services**
    > This is not documented yet

## **1. User Authentication**

### `/auth/login` - **POST**

**Description**: User login.

**Request**:

```json
{
    "username": "user@example.com",
    "password": "user_password"
}
```

**Responses**:

-   `200 OK`:

    ```json
    {
        "message": "Login successful.",
        "accessToken": "user_access_token"
    }
    ```

-   `400 Bad Request`:

    ```json
    {
        "message": "Invalid request parameters."
    }
    ```

-   `401 Unauthorized`:

    ```json
    {
        "message": "Invalid username or password."
    }
    ```

-   `500 Internal Server Error`:
    ```json
    {
        "message": "An error occurred. Please try again later."
    }
    ```

---

### `/auth/logout` - **POST**

**Description**: User logout.

**Headers**:

-   **Authorization**: `Access Token`

**Responses**:

-   `200 OK`:

    ```json
    {
        "message": "Logout successful."
    }
    ```

-   `401 Unauthorized`:

    ```json
    {
        "message": "Invalid access token."
    }
    ```

-   `500 Internal Server Error`:
    ```json
    {
        "message": "An error occurred. Please try again later."
    }
    ```

---

### `/auth/request-reset-password` - **POST**

**Description**: Initiate a password reset.

**Request**:

```json
{
    "email": "user@example.com"
}
```

**Responses**:

-   `200 OK`:

    ```json
    {
        "message": "Password reset link sent to email."
    }
    ```

-   `400 Bad Request`:

    ```json
    {
        "message": "Invalid email format."
    }
    ```

-   `404 Not Found`:

    ```json
    {
        "message": "User with this email not found."
    }
    ```

-   `500 Internal Server Error`:
    ```json
    {
        "message": "An error occurred. Please try again later."
    }
    ```

---

### `/auth/confirm-reset-password` - **PATCH**

**Description**: Confirm and process the password reset.

**Headers**:

-   **Authorization**: `Access Token`

**Request**:

```json
{
    "newPassword": "new_user_password"
}
```

**Responses**:

-   `200 OK`:

    ```json
    {
        "message": "Password updated successfully."
    }
    ```

-   `400 Bad Request`:

    ```json
    {
        "message": "Invalid password format."
    }
    ```

-   `401 Unauthorized`:

    ```json
    {
        "message": "Invalid access token."
    }
    ```

-   `500 Internal Server Error`:
    ```json
    {
        "message": "An error occurred. Please try again later."
    }
    ```

## **2. User Details**

### `/user/info/profile` - **GET**

**Description**: Fetch user details.

**Headers**:

-   **Authorization**: `Access Token`

**Responses**:

-   `200 OK`:

    ```json
    {
        "name": "user_name",
        "email": "user_email",
        "mobile": "user_contact_number",
        "image": "user_image_URL",
        "message": "User details fetched succedfully"
    }
    ```

-   `401 Unauthorized`:

    ```json
    {
        "message": "Invalid access token."
    }
    ```

-   `404 Not Found`:

    ```json
    {
        "message": "User not found."
    }
    ```

-   `500 Internal Server Error`:
    ```json
    {
        "message": "An error occurred. Please try again later."
    }
    ```

---

### `/user/plan/current` - **GET**

**Description**: Details of the user's current plan.

**Headers**:

-   **Authorization**: `Access Token`

**Responses**:

-   `200 OK`:

    ```json
    {
        "id": "plan_id",
        "title": "plan_name",
        "speed": "plan_speed",
        "expiry": "expiry_date",
        "dataUsed": "data_usage",
        "type": "Postpaid / Prepaid",
        "invoice": "plan_invoice_url",
        "message": "Current plans fetched successfully"
    }
    ```

-   `401 Unauthorized`:

    ```json
    {
        "message": "Invalid access token."
    }
    ```

-   `404 Not Found`:

    ```json
    {
        "message": "Plan not found."
    }
    ```

-   `500 Internal Server Error`:
    ```json
    {
        "message": "An error occurred. Please try again later."
    }
    ```

---

### `/user/plan/history` - **GET**

**Description**: Details of all the plans user has subscribed.

**Headers**:

-   **Authorization**: `Access Token`

**Responses**:

-   `200 OK`:

    ```json
    {
        "meta": {
            "currentPage": 1,
            "perPage": 10,
            "totalPages": 3,
            "totalItems": 25,
        },
        "plans": [
            {
                "id": "plan_id",
                "title": "plan_name",
                "speed": "plan_speed",
                "expiry": "expiry_date",
                "dataUsed": "data_usage",
                "type": "Postpaid / Prepaid",
                "invoice": "plan_invoice_url"
            },
            ...
        ],
        "message": "Plans history fetched successfully"
    }
    ```

-   `401 Unauthorized`:

    ```json
    {
        "message": "Invalid access token."
    }
    ```

-   `404 Not Found`:

    ```json
    {
        "message": "No plan history found for the user."
    }
    ```

-   `500 Internal Server Error`:
    ```json
    {
        "message": "An error occurred fetching plan history. Please try again later."
    }
    ```

---

### `/user/info/geo-location` - **GET**

**Description**: Retrieve updated location of the user.

**Headers**:

-   **Authorization**: `Access Token`

**Responses**:

-   `200 OK`:

    ```json
    {
        "geolocation": {
            "latitude": "user_location_latitudeValue",
            "longitude": "user_location_longitudeValue"
        },
        "message": "Geo location fetched successfully"
    }
    ```

-   `401 Unauthorized`:

    ```json
    {
        "message": "Invalid access token."
    }
    ```

-   `500 Internal Server Error`:
    ```json
    {
        "message": "An error occurred fetching geolocation. Please try again later."
    }
    ```

---

### `/user/update/email` - **PATCH**

**Description**: Update user's email.

**Headers**:

-   **Authorization**: `Access Token`

**Request**:

```json
{
    "newEmail": "new_user_email"
}
```

**Responses**:

-   `200 OK`:

    ```json
    {
        "message": "Email updated successfully."
    }
    ```

-   `400 Bad Request`:

    ```json
    {
        "message": "Invalid email format."
    }
    ```

-   `401 Unauthorized`:

    ```json
    {
        "message": "Invalid access token."
    }
    ```

-   `409 Conflict`:

    ```json
    {
        "message": "Email already in use."
    }
    ```

-   `500 Internal Server Error`:
    ```json
    {
        "message": "An error occurred updating email. Please try again later."
    }
    ```

---

### `/user/update/password` - **PATCH**

**Description**: Update user's password.

**Headers**:

-   **Authorization**: `Access Token`

**Request**:

```json
{
    "newPassword": "new_user_password"
}
```

**Responses**:

-   `200 OK`:

    ```json
    {
        "message": "Password updated successfully."
    }
    ```

-   `400 Bad Request`:

    ```json
    {
        "message": "Invalid password format."
    }
    ```

-   `401 Unauthorized`:

    ```json
    {
        "message": "Invalid access token."
    }
    ```

-   `500 Internal Server Error`:
    ```json
    {
        "message": "An error occurred updating the password. Please try again later."
    }
    ```

---

### `/user/update/mobile` - **PATCH**

**Description**: Update user's mobile number.

**Headers**:

-   **Authorization**: `Access Token`

**Request**:

```json
{
    "newMobile": "new_user_mobile"
}
```

**Responses**:

-   `200 OK`:

    ```json
    {
        "message": "Mobile number updated successfully."
    }
    ```

-   `400 Bad Request`:

    ```json
    {
        "message": "Invalid mobile number format."
    }
    ```

-   `401 Unauthorized`:

    ```json
    {
        "message": "Invalid access token."
    }
    ```

-   `409 Conflict`:

    ```json
    {
        "message": "Mobile number already in use."
    }
    ```

-   `500 Internal Server Error`:
    ```json
    {
        "message": "An error occurred updating the mobile number. Please try again later."
    }
    ```

---

### `/user/update/mac-address` - **PATCH**

**Description**: Update user's MAC address.

**Headers**:

-   **Authorization**: `Access Token`

**Request**:

```json
{
    "newMac": "new_user_mac_address"
}
```

**Responses**:

-   `200 OK`:

    ```json
    {
        "message": "MAC address updated successfully."
    }
    ```

-   `400 Bad Request`:

    ```json
    {
        "message": "Invalid MAC address format."
    }
    ```

-   `401 Unauthorized`:

    ```json
    {
        "message": "Invalid access token."
    }
    ```

-   `409 Conflict`:

    ```json
    {
        "message": "MAC address already associated with another user."
    }
    ```

-   `500 Internal Server Error`:
    ```json
    {
        "message": "An error occurred updating the MAC address. Please try again later."
    }
    ```

---

### `/user/update/geo-location` - **PATCH**

**Description**: Update user's geolocation.

**Headers**:

-   **Authorization**: `Access Token`

**Request**:

```json
{
    "newLocation": {
        "latitude": "latitude_value",
        "longitude": "longitude_value"
    }
}
```

**Responses**:

-   `200 OK`:

    ```json
    {
        "message": "Geolocation updated successfully."
    }
    ```

-   `400 Bad Request`:

    ```json
    {
        "message": "Invalid geolocation format."
    }
    ```

-   `401 Unauthorized`:

    ```json
    {
        "message": "Invalid access token."
    }
    ```

-   `500 Internal Server Error`:
    ```json
    {
        "message": "An error occurred updating the geolocation. Please try again later."
    }
    ```

## **3. Enterprise Plans**

### `/company/service/plans` - **GET**

**Description**: Retrieve the current enterprise plans.

**Responses**:

-   `200 OK`:

    ```json
    {
        "plans":[
            {
                "id": "plan_id",
                "title": "plan_name",
                "speed": "plan_speed",
                "validity": "validity_period",
                "amount": "plan_amount",
                "type": "Postpaid / Prepaid",
            },
      ...
    ],
    "message": "enterprise plans fetched successfully"
    }
    ```

-   `500 Internal Server Error`:

    ```json
    {
        "message": "An error occurred. Please try again later."
    }
    ```

## **4. Complaints**

### `/user/complaint/new-complaint` - **POST**

**Description**: Registration of new complaint

**Headers**:

-   **Authorization** : `Access Token`

**Request**:

```json
{
    "mainType": "main_issue_type",
    "subType": "specific_issue_type",
    "description": "detailed_description"
}
```

**Responses**:

-   `200 OK`:

    ```json
    {
        "message": "Complaint registered successfully."
    }
    ```

-   `400 Bad Request`:

    ```json
    {
        "message": "Invalid complaint details."
    }
    ```

-   `401 Unauthorized`:

    ```json
    {
        "message": "Invalid access token."
    }
    ```

-   `500 Internal Server Error`:
    ```json
    {
        "message": "An error occurred. Please try again later."
    }
    ```

---

### `/user/complaint/history` - **GET**

**Description**: Details of the complaints raised by the user

**Headers**:

-   **Authorization** : `Access Token`

**Responses**:

-   `200 OK`:

    ```json
    {
        "meta":{
                "currentPage": 1,
                "perPage": 10,
                "totalPages": 3,
                "totalItems": 27,
        },
        "complaints": [
            {
                "id": "",
                "mainType": "main_issue_type",
                "subType": "specific_issue_type",
                "description": "detailed_description",
                "date": "",
                "status": "closed / open",
                "rating": ""
            },
            ...
        ],
        "message": "Complaint history fetched successfully"
    }
    ```

-   `401 Unauthorized`:

    ```json
    {
        "message": "Invalid access token."
    }
    ```

-   `500 Internal Server Error`:
    ```json
    {
        "message": "An error occurred. Please try again later."
    }
    ```

## **5. Company's policy details**

### `/company/info/faq` - **GET**

**Description** : Details of Frequently asked questions

**Responses**:

-   `200 OK`:
    ```json
    {
        "meta":{
            "currentPage": 1,
            "perPage": 10,
            "totalPages": 3,
            "totalItems": 25,
        },
        "faq": [
            {
                "question": "What is the company's policy on refunds?",
                "answer": "..."
            },
            ...
        ],
        "message": "FAQ's fetched successfully"
    }
    ```

-   `500 Internal Server Error`:
    ```json
    {
        "message": "An error occurred fetching FAQs. Please try again later."
    }
    ```

### `/company/info/privacy-policy` - **GET**

**Description** : privacy polices of the company

**Responses**:

-   `200 OK`:

    ```json
    {
        "title": "Privacy Policy",
        "content": "This is the detailed privacy policy...",
        "lastUpdated": "date_last_updated",
        "message": "Privacy Policies fetched successfully"
    }
    ```

-   `500 Internal Server Error`:
    ```json
    {
        "message": "An error occurred fetching the privacy policy. Please try again later."
    }
    ```

### `/company/info/terms-conditions` - **GET**

**Description** : terms and conditions of the company

**Responses**:

-   `200 OK`:

    ```json
    {
        "title": "Terms and Conditions",
        "content": "These are the detailed terms and conditions...",
        "lastUpdated": "date_last_updated",
        "message": "Terms & Conditions fetched successfully"
    }
    ```

-   `500 Internal Server Error`:

    ```json
    {
        "message": "An error occurred fetching terms and conditions. Please try again later."
    }
    ```

## **6. Session History**

### `/user/info/session-history` - **GET**

**Description** : session history of the user

**Responses**:

-   `200 OK`:

    ```json
    {
        "meta": {
            "currentPage": 1,
            "perPage": 10,
            "totalPages": 5,
            "totalItems": 46,
        },
        "sessions": [
            {
                "sessionId": "unique_session_id",
                "startTime": "start_time_of_session",
                "endTime": "end_time_of_session",
                "dataUsed": "data_used_in_session",
                "device": "device_name_used"
            },
            ...
        ],
        "message": "Session History fetched successfully"
    }

    ```

-   `400 Bad Request`:

    ```json
    {
        "message": "Invalid access token."
    }
    ```

-   `401 Unauthorized`:

    ```json
    {
        "message": "No session history found for the user."
    }
    ```

-   `500 Internal Server Error`:
    ```json
    {
        "message": "An error occurred fetching session history. Please try again later."
    }
    ```

Documented with ❤️ by **Nitheeshwar B R** & **Pratik k**
