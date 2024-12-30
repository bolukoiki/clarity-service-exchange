;; This smart contract facilitates a decentralized service marketplace where users can list, buy, and sell services.
;; Key features include:
;; 1. Service cost management by the platform owner.
;; 2. Platform fee calculation and handling of refunds.
;; 3. A user service balance system to track available services and tokens.
;; 4. Restrictions on the total number of services allowed in the system.
;; 5. Allowing users to purchase services from others with automatic fee deductions.
;; 6. Refund handling in case of service cancellation.
;; 7. Limitations on the number of services a user can add to prevent abuse.
;; The contract ensures the correct flow of services, tokens, and fees, offering a transparent and secure environment for transactions.

;; Constants
(define-constant owner tx-sender)
(define-constant err-only-owner (err u200))
(define-constant err-insufficient-funds (err u201))
(define-constant err-failed-transaction (err u202))
(define-constant err-invalid-cost (err u203))
(define-constant err-invalid-quantity (err u204))
(define-constant err-service-fee (err u205))
(define-constant err-refund-failure (err u206))
(define-constant err-self-transaction (err u207))
(define-constant err-limit-exceeded (err u208))
(define-constant err-invalid-limit (err u209))

;; Data Variables
(define-data-var service-cost uint u150) ;; Cost per service in microstacks (1 STX = 1,000,000 microstacks)
(define-data-var max-services-per-user uint u50) ;; Max number of services a user can add
(define-data-var platform-fee-rate uint u3) ;; Platform fee rate percentage (e.g., 3%)
(define-data-var refund-rate uint u85) ;; Refund rate as a percentage (e.g., 85% of the current cost)
(define-data-var total-service-limit uint u100000) ;; Global limit on total services in the system
(define-data-var current-total-services uint u0) ;; Current total services in the system

;; Data Maps
(define-map user-service-balance principal uint)
(define-map user-token-balance principal uint)
(define-map services-for-sale {user: principal} {quantity: uint, cost: uint})

;; Private Functions

;; Calculate the platform fee
(define-private (calculate-platform-fee (quantity uint))
  (/ (* quantity (var-get platform-fee-rate)) u100))

;; Calculate refund amount
(define-private (calculate-refund (quantity uint))
  (/ (* quantity (var-get service-cost) (var-get refund-rate)) u100))

;; Update total services in the system
(define-private (modify-total-services (quantity int))
  (let (
    (current-services (var-get current-total-services))
    (new-total (if (< quantity 0)
                   (if (>= current-services (to-uint (- quantity)))
                       (- current-services (to-uint (- quantity)))
                       u0)
                   (+ current-services (to-uint quantity))))
  )
    (asserts! (<= new-total (var-get total-service-limit)) err-limit-exceeded)
    (var-set current-total-services new-total)
    (ok true)))
