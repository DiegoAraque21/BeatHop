//Beat Hop Team
//Player jump mechanics

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
 
public class PlayerMovement : MonoBehaviour
{
    public Rigidbody2D rb;
    public float moveSpeed;
    private SpriteRenderer sr;
    
    public float jumpForce;
    private float moveInput;
 
    private bool isGrounded;
    public Transform feetPos;
    public float checkRadius;
    public LayerMask whatIsGround;
 
    public float jumpStartTime;
    private float jumpTime;
    private bool isJumping;
 
    public Animator animator;
 
 
    // Start is called before the first frame update

    //Save game components into variables
    void Start()
    {
        rb = GetComponent<Rigidbody2D>();
        sr = GetComponent<SpriteRenderer>();
    }
 
    // Update is called once per frame

    //Call Jump method on update
    void Update()
    {   
        
        Jump();
        // var rotationVector = transform.rotation.eulerAngles;
        // rotationVector.z = 0;
        // transform.rotation = Quaternion.Euler(rotationVector);
    }
    

    //Make player move to the right
    void FixedUpdate()
    {
        rb.velocity = new Vector2(moveSpeed, rb.velocity.y);
    }
    

    //Player's jump mechanics
    void Jump()
    {
        isGrounded = Physics2D.OverlapCircle(feetPos.position, checkRadius, whatIsGround);
 
        if (isGrounded == true && Input.GetButtonDown("Jump"))
        {
            isJumping = true;
            animator.SetBool("isJumping", true);
            jumpTime = jumpStartTime;
            rb.velocity = Vector2.up * jumpForce;
        }
 
        if (Input.GetButtonUp("Jump"))
        {   
            Vector3 vel = rb.velocity;
            vel.y /=2;
            rb.velocity = vel;
            isJumping = false;
        }
        if (!isJumping && isGrounded)
        {   
            animator.SetBool("isJumping", false);
        }
    }
 
    
    //Function for checking if the player is touching the ground
    void OnDrawGizmos()
    {
        Gizmos.DrawWireSphere(feetPos.position, checkRadius);
    }
}