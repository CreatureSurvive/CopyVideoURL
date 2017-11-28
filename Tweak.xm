%hook MPMoviePlayerControllerNew

- (void)setContentURL: (NSURL *)url {
    %orig(url);
    @try {
        [[UIPasteboard generalPasteboard] setString:[url absoluteString]];
    } @catch (NSException *exception) {
        CSDebug(@"CopyVideoURL Error: %@", exception);
    }
}

%end