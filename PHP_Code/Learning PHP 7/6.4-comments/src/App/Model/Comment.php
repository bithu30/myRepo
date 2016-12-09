<?php

namespace App\Model;

/**
 * Comment
 */
class Comment
{
    /**
     * @var integer
     */
    private $id;

    /**
     * @var string
     */
    private $comment;

    /**
     * @var \DateTime
     */
    private $posted_at;

    /**
     * @var \App\Model\Post
     */
    private $post;

    /**
     * @var \App\Model\User
     */
    private $user;


    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set comment
     *
     * @param string $comment
     *
     * @return Comment
     */
    public function setComment($comment)
    {
        $this->comment = $comment;

        return $this;
    }

    /**
     * Get comment
     *
     * @return string
     */
    public function getComment()
    {
        return $this->comment;
    }

    /**
     * Set postedAt
     *
     * @param \DateTime $postedAt
     *
     * @return Comment
     */
    public function setPostedAt($postedAt)
    {
        $this->posted_at = $postedAt;

        return $this;
    }

    /**
     * Get postedAt
     *
     * @return \DateTime
     */
    public function getPostedAt()
    {
        return $this->posted_at;
    }

    /**
     * Set post
     *
     * @param \App\Model\Post $post
     *
     * @return Comment
     */
    public function setPost(\App\Model\Post $post)
    {
        $this->post = $post;

        return $this;
    }

    /**
     * Get post
     *
     * @return \App\Model\Post
     */
    public function getPost()
    {
        return $this->post;
    }

    /**
     * Set user
     *
     * @param \App\Model\User $user
     *
     * @return Comment
     */
    public function setUser(\App\Model\User $user)
    {
        $this->user = $user;

        return $this;
    }

    /**
     * Get user
     *
     * @return \App\Model\User
     */
    public function getUser()
    {
        return $this->user;
    }
}

