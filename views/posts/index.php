<p>Here is a list of all posts:</p>

<?php foreach($posts as $post) { ?>
  <p>
    <?php echo $post->author; ?>
    <a href='?controller=posts&action=show&id=<?php echo $post->id; ?>'>See content</a>
  </p>
<?php } ?>

<form name="post" method="post" action="formProcess.php">
	<table align="center">
		<caption> Please write the comments below</caption>
		<tr>
			<td>
				<label> Comment</label>
			</td>
			<td>
				<textarea rows='5' columns='100' name="user['comment']"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				<label>First Name</label>
			</td>
			<td>
				<input type="text" name="user['firstName']">
			</td>
		</tr>
		<tr>
			<td>
				<label>Last Name</label>
			</td>
			<td>
				<input type="text" name="user['lastName']">
			</td>
		</tr>
		<tr>
			<td>
				<label>Email Address</label>
			</td>
			<td>
				<input type="email" name="user['email']">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="Submit">
			</td>
		</tr>
	</table>
</form>