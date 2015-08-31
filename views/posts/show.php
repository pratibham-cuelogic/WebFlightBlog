<p>Posted By <br><?php echo $post->author; ?></p>
<p><?php echo $post->content; ?></p>

<form name="post" action="/WebFlight/views/posts/formProcess.php">
	<table align="center">
		<caption> Please write the comments below</caption>
		<tr>
			<td>
				<label> Comment</label>
			</td>
			<td>
				<textarea rows='5' columns='100' name="comment"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				<label>Your Name</label>
			</td>
			<td>
				<input type="text" name="Name">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="Submit">
			</td>
		</tr>
	</table>
</form>
