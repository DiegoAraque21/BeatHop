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
 
 
 
    // Start is called before the first frame update
    void Start()
    {
        rb = GetComponent<Rigidbody2D>();
        sr = GetComponent<SpriteRenderer>();
    }
 
    // Update is called once per frame
    void Update()
    {   
        
        Jump();
        var rotationVector = transform.rotation.eulerAngles;
        rotationVector.z = 0;
        transform.rotation = Quaternion.Euler(rotationVector);
    }
 
    void FixedUpdate()
    {
        rb.velocity = new Vector2(moveSpeed, rb.velocity.y);
    }
 
    void Jump()
    {
        isGrounded = Physics2D.OverlapCircle(feetPos.position, checkRadius, whatIsGround);
 
        if (isGrounded == true && Input.GetButtonDown("Jump"))
        {
            isJumping = true;
            jumpTime = jumpStartTime;
            rb.velocity = Vector2.up * jumpForce;
        }
 
        if (Input.GetButton("Jump") && isJumping == true)
        {   
            
            if (jumpTime > 0)
            {
                rb.velocity = Vector2.up * jumpForce;
                jumpTime -= Time.deltaTime;
            }
            else
            {
                isJumping = false;
            }
        }
 
        if (Input.GetButtonUp("Jump"))
        {   
            
            isJumping = false;
        }
    }
 
    
 
    void OnDrawGizmos()
    {
        Gizmos.DrawWireSphere(feetPos.position, checkRadius);
    }
}
  
  
  